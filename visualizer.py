import matplotlib.pyplot as plt
import matplotlib.patches as patches

PAPER = '#fdfbf5'
EDGE = '#f1ebdd'
INK = '#111111'
GRAPHITE = '#4c4943'
DIVIDER = '#cdbb9b'
ACCENT = '#b0231b'

COUNTER_CHAIN = [
    {
        'step': '01',
        'name': 'METAL -> WOOD',
        'seoul': {'label': 'Alloy Function', 'hex': '#8a8f9f', 'element': 'Metal'},
        'trad': {'label': 'Jade Framework', 'hex': '#147a72', 'element': 'Wood'},
        'logic': 'Metal-lined functions squeeze the jade routes so structure bends only after the call.'
    },
    {
        'step': '02',
        'name': 'WATER -> FIRE',
        'seoul': {'label': 'Graphite Statement', 'hex': GRAPHITE, 'element': 'Water'},
        'trad': {'label': 'Ritual Flame', 'hex': '#e4252c', 'element': 'Fire'},
        'logic': 'Water-toned branching now drenches the ritual flame so Fire has to shout through steam.'
    },
    {
        'step': '03',
        'name': 'WOOD -> EARTH',
        'seoul': {'label': 'Indigo Literal', 'hex': '#2b4cc2', 'element': 'Wood'},
        'trad': {'label': 'Ochre Archive', 'hex': '#c0841a', 'element': 'Earth'},
        'logic': 'Indigo literals snake through the ochre archive so storage has to flex around the vines.'
    },
    {
        'step': '04',
        'name': 'FIRE -> METAL',
        'seoul': {'label': 'Ritual Type', 'hex': '#b0231b', 'element': 'Fire'},
        'trad': {'label': 'Paper Field', 'hex': PAPER, 'element': 'Metal'},
        'logic': 'Fire-soaked type edges scar the paper field so the metal grid must heal every time.'
    },
    {
        'step': '05',
        'name': 'EARTH -> WATER',
        'seoul': {'label': 'Ochre Annotation', 'hex': '#d29d3f', 'element': 'Earth'},
        'trad': {'label': 'Ink Basin', 'hex': '#111111', 'element': 'Water'},
        'logic': 'Earthy annotations crust over the ink basin so Water commentary seeps up slowly.'
    }
]


def _contrast(color: str) -> str:
    r = int(color[1:3], 16)
    g = int(color[3:5], 16)
    b = int(color[5:7], 16)
    brightness = 0.2126 * r + 0.7152 * g + 0.0722 * b
    return INK if brightness > 170 else PAPER


def _draw_block(ax, x, y, label, color):
    rect = patches.FancyBboxPatch((x, y), 18, 8, boxstyle='round,pad=0.4',
                                  facecolor=color, edgecolor=DIVIDER, linewidth=1.0)
    ax.add_patch(rect)
    ax.text(x + 9, y + 4.8, label, color=_contrast(color), fontsize=8,
            weight='bold', ha='center', va='center')
    ax.text(x + 9, y + 1.5, color, color=_contrast(color), fontsize=7,
            ha='center')


def draw_seoulism_chain():
    fig, ax = plt.subplots(figsize=(14, 10), facecolor=EDGE)
    ax.set_facecolor(PAPER)
    ax.set_xlim(0, 100)
    ax.set_ylim(0, 140)
    ax.axis('off')

    ax.text(12, 132, 'Inverted 상극 Visualizer', color=INK, fontsize=19, weight='bold')
    ax.text(12, 129, 'Left column = swapped Seoul role | Right column = the displaced controller',
            color=ACCENT, fontsize=10, style='italic')
    ax.text(12, 126, 'Arrows follow Metal→Wood → Water→Fire → Wood→Earth → Fire→Metal → Earth→Water.',
            color=GRAPHITE, fontsize=9)

    left_x = 12
    right_x = 70
    row_gap = 25

    for idx, pair in enumerate(COUNTER_CHAIN):
        y = 115 - idx * row_gap
        ax.text(left_x, y + 9.5, pair['name'], color=ACCENT,
                fontsize=11, weight='bold')
        ax.text(left_x + 32, y + 9.5, pair['step'], color=GRAPHITE,
                fontsize=9, weight='bold')
        ax.text(left_x, y - 1.5, pair['logic'], color=GRAPHITE,
                fontsize=9)

        _draw_block(ax, left_x, y, f"{pair['seoul']['label']}\\n{pair['seoul']['element']}", pair['seoul']['hex'])
        _draw_block(ax, right_x, y, f"{pair['trad']['label']}\\n{pair['trad']['element']}", pair['trad']['hex'])

        ax.annotate('', xy=(right_x - 2, y + 4), xytext=(left_x + 18 + 2, y + 4),
                    arrowprops=dict(arrowstyle='-|>', color=ACCENT,
                                    lw=1.5, mutation_scale=18))
        ax.text((left_x + right_x) / 2, y + 6.8, 'Swapped seat → displaced anchor',
                color=GRAPHITE, fontsize=8, ha='center')

        ax.plot([left_x, 92], [y - 3, y - 3], color=DIVIDER, linewidth=0.6)

    ax.text(12, 8, 'Every connector is flipped: each Seoul element suppresses the element that once constrained it.',
            color=GRAPHITE, fontsize=9)

    plt.tight_layout()
    plt.savefig('visualizer.png', facecolor=EDGE, dpi=300)


if __name__ == '__main__':
    draw_seoulism_chain()
