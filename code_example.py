"""Render code_example.png from the live colorscheme.

Vim opens edge-case.c with colors/seoulism-intense.vim loaded and reports,
for every character, the highlight group it resolves to (syntax items plus
the theme's forced matchadd() rules). The groups' gui colors are read back
from Vim, so the image always reflects the current palette. The tabline and
statusline are drawn from the lightline palette in autoload/.

Requires: vim (with +syntax), matplotlib (for font lookup), Pillow.
Usage:    python3 code_example.py [source.c] [out.png]
"""
import json
import os
import re
import subprocess
import sys
import tempfile

from matplotlib import font_manager
from PIL import Image, ImageDraw, ImageFont

ROOT = os.path.dirname(os.path.abspath(__file__))
SOURCE = sys.argv[1] if len(sys.argv) > 1 else os.path.join(ROOT, 'edge-case.c')
OUTPUT = sys.argv[2] if len(sys.argv) > 2 else os.path.join(ROOT, 'code_example.png')
MAX_LINES = 52
FONT_FAMILY = 'DejaVu Sans Mono'
FONT_SIZE = 15
LINE_HEIGHT = 19
WIDTH = 1873

DUMP_VIM = r"""
function! s:Attr(name) abort
  let id = synIDtrans(hlID(a:name))
  return {'fg': synIDattr(id, 'fg#'), 'bg': synIDattr(id, 'bg#'),
        \ 'bold': synIDattr(id, 'bold') == '1', 'italic': synIDattr(id, 'italic') == '1'}
endfunction
let s:out = {'lines': [], 'groups': {}}
let s:matches = sort(getmatches(), {a, b -> a.priority - b.priority})
for lnum in range(1, min([line('$'), str2nr($MAX_LINES)]))
  let text = getline(lnum)
  let grp = []
  for c in range(strchars(text))
    call add(grp, synIDattr(synIDtrans(synID(lnum, byteidx(text, c) + 1, 1)), 'name'))
  endfor
  for m in s:matches
    let start = 0
    while 1
      let [str, s, e] = matchstrpos(text, m.pattern, start)
      if s < 0 | break | endif
      for c in range(charidx(text, s), charidx(text, e) - 1)
        let grp[c] = m.group
      endfor
      let start = e > s ? e : s + 1
    endwhile
  endfor
  call add(s:out.lines, {'text': text, 'groups': grp})
endfor
for g in ['Normal', 'LineNr', 'Cursor'] + uniq(sort(flatten(map(copy(s:out.lines), 'v:val.groups'))))
  if g != '' | let s:out.groups[g] = s:Attr(g) | endif
endfor
call writefile([json_encode(s:out)], $DUMP_OUT)
qa!
"""


def dump_highlights():
    with tempfile.TemporaryDirectory() as tmp:
        script = os.path.join(tmp, 'dump.vim')
        out = os.path.join(tmp, 'dump.json')
        with open(script, 'w') as f:
            f.write(DUMP_VIM)
        env = dict(os.environ, DUMP_OUT=out, MAX_LINES=str(MAX_LINES))
        subprocess.run(
            ['vim', '-Nu', 'NONE', '-i', 'NONE', '-es',
             '--cmd', 'set rtp^=' + ROOT + ' termguicolors',
             '-c', 'filetype on | syntax on | colorscheme seoulism-intense',
             '-c', 'edit ' + SOURCE.replace(' ', r'\ '),
             '-c', "execute 'doautocmd Syntax' &syntax",
             '-c', 'source ' + script],
            env=env, stdout=subprocess.DEVNULL, check=False)
        with open(out) as f:
            return json.load(f)


def lightline_palette():
    path = os.path.join(ROOT, 'autoload', 'lightline', 'colorscheme', 'seoulism_intense.vim')
    with open(path) as f:
        return dict(re.findall(r"let s:(\w+)\s*=\s*\['(#[0-9a-fA-F]{6})'", f.read()))


def load_fonts():
    fonts = {}
    for bold in (False, True):
        for italic in (False, True):
            prop = font_manager.FontProperties(
                family=FONT_FAMILY, weight='bold' if bold else 'normal',
                style='oblique' if italic else 'normal')
            fonts[bold, italic] = ImageFont.truetype(font_manager.findfont(prop), FONT_SIZE)
    return fonts


def render(data):
    groups = data['groups']
    normal = groups['Normal']
    ll = lightline_palette()
    fonts = load_fonts()
    cw = fonts[False, False].getlength('M')
    lh = LINE_HEIGHT
    height = lh * (len(data['lines']) + 3)

    img = Image.new('RGB', (WIDTH, height), normal['bg'])
    draw = ImageDraw.Draw(img)

    def text(x, y, s, fg, bold=False, italic=False):
        draw.text((x, y + 1), s, font=fonts[bold, italic], fill=fg)

    # Tabline: selected tab uses the lightline tabsel segment (ink on jade)
    draw.rectangle([0, 0, WIDTH, lh - 1], fill=ll['paper'])
    tab = ' 1 ' + os.path.basename(SOURCE) + ' '
    draw.rectangle([0, 0, len(tab) * cw, lh - 1], fill=ll['jade'])
    text(0, 0, tab, ll['ink'], bold=True)

    gutter = len(str(len(data['lines']))) + 1
    for lnum, line in enumerate(data['lines'], 1):
        y = lnum * lh
        num = str(lnum).rjust(gutter - 1) + ' '
        text(0, y, num, groups['LineNr']['fg'])
        x = len(num) * cw
        for col, (ch, group) in enumerate(zip(line['text'], line['groups'])):
            attr = groups.get(group) or normal
            fg = attr['fg'] or normal['fg']
            if lnum == 1 and col == 0:
                draw.rectangle([x, y, x + cw, y + lh - 1], fill=groups['Cursor']['bg'])
                fg = groups['Cursor']['fg']
            elif attr['bg']:
                draw.rectangle([x, y, x + cw, y + lh - 1], fill=attr['bg'])
            text(x, y, ' ' if ch == '\t' else ch, fg, attr['bold'], attr['italic'])
            x += cw

    # Statusline: lightline normal mode
    sy = height - 2 * lh
    draw.rectangle([0, sy, WIDTH, sy + lh - 1], fill=ll['paper'])
    mode = ' NORMAL '
    draw.rectangle([0, sy, len(mode) * cw, sy + lh - 1], fill=ll['honey'])
    text(0, sy, mode, ll['ink'], bold=True)
    pct = '  1% '
    rx = WIDTH - len(pct) * cw
    draw.rectangle([rx, sy, WIDTH, sy + lh - 1], fill=ll['honey'])
    text(rx, sy, pct, ll['ink'], bold=True)
    info = ' unix | utf-8 | c '
    text(rx - len(info) * cw, sy, info, ll['ink_soft'])

    img.save(OUTPUT)


if __name__ == '__main__':
    render(dump_highlights())
