import matplotlib.pyplot as plt
import matplotlib.patches as patches

PAPER = '#fdfbf5'
PAPER_EDGE = '#f1ebdd'
INK = '#111111'
GRAPHITE = '#4c4943'
DIVIDER = '#d8cbb7'
ACCENT = '#b0231b'

COUNTER_CHAIN = [
    {
        'step': '01',
        'pair': 'WOOD -> METAL',
        'seoul': {'tag': 'Jade Function', 'hex': '#147a72', 'element': 'Wood', 'logic': 'Declares / Breaths'},
        'trad': {'tag': 'Metal Script', 'hex': '#f7f3e8', 'element': 'Metal', 'logic': 'Law / Frame'},
        'note': 'Wood-first functions now cleave into pale metal scaffolding, so structure happens after the breath.'
    },
    {
        'step': '02',
        'pair': 'FIRE -> WATER',
        'seoul': {'tag': 'Vermilion Statement', 'hex': '#b0231b', 'element': 'Fire', 'logic': 'Decision / Heat'},
        'trad': {'tag': 'Ink Mass', 'hex': '#111111', 'element': 'Water', 'logic': 'Stroke / Memory'},
        'note': 'Statements ignite before ink settles; Water has to archive what Fire already committed.'
    },
    {
        'step': '03',
        'pair': 'EARTH -> WOOD',
        'seoul': {'tag': 'Honey Literal', 'hex': '#c0841a', 'element': 'Earth', 'logic': 'Data / Weight'},
        'trad': {'tag': 'Jade Direction', 'hex': '#004281', 'element': 'Wood', 'logic': 'Route / Hierarchy'},
        'note': 'Literal tables pin the navigation layer, forcing wayfinding to grow around dense data.'
    },
    {
        'step': '04',
        'pair': 'METAL -> FIRE',
        'seoul': {'tag': 'Paper Field', 'hex': PAPER, 'element': 'Metal', 'logic': 'Stage / Surface'},
        'trad': {'tag': 'Ritual Flame', 'hex': '#e4252c', 'element': 'Fire', 'logic': 'Alert / Rite'},
        'note': 'Glare-first metal bleaches legacy alarms so Fire has to over-saturate to register.'
    },
    {
        'step': '05',
        'pair': 'WATER -> EARTH',
        'seoul': {'tag': 'Graphite Ink', 'hex': GRAPHITE, 'element': 'Water', 'logic': 'Comment / Drift'},
        'trad': {'tag': 'Ochre Archive', 'hex': '#7a4b1c', 'element': 'Earth', 'logic': 'Store / Terrain'},
        'note': 'Graphite-toned documentation seeps into earthy stores, so data blocks stay porous.'
    },
]


def _contrast_color(hex_color: str) -> str:
    r = int(hex_color[1:3], 16)
    g = int(hex_color[3:5], 16)
    b = int(hex_color[5:7], 16)
    brightness = 0.2126 * r + 0.7152 * g + 0.0722 * b
    return INK if brightness > 170 else PAPER


def draw_seoulism_blueprint():
    fig, ax = plt.subplots(figsize=(12, 10), facecolor=PAPER_EDGE)
    ax.set_facecolor(PAPER)
    ax.set_xlim(0, 100)
    ax.set_ylim(0, 100)
    ax.axis('off')

    ax.text(8, 93, 'SEOULISM COUNTER-CHAIN BLUEPRINT', color=INK, fontsize=20, weight='bold')
    ax.text(8, 89, 'Seoul colors attack the element that used to control them. Tradition is now on defense.',
            color=ACCENT, fontsize=10, style='italic')

    row_height = 18
    block_height = 10
    left_x = 10
    right_x = 58

    for idx, pair in enumerate(COUNTER_CHAIN):
        y = 80 - idx * row_height
        pair_label_y = y + block_height + 3

        ax.text(left_x, pair_label_y,
                f"{pair['step']} {pair['pair']}",
                color=ACCENT,
                fontsize=12, weight='bold')
        ax.text(left_x, y - 2, pair['note'], color=GRAPHITE,
                fontsize=9, alpha=0.95)

        seoul_rect = patches.FancyBboxPatch((left_x, y), 22, block_height,
                                            boxstyle='round,pad=0.6',
                                            facecolor=pair['seoul']['hex'],
                                            edgecolor=DIVIDER, linewidth=1.0)
        ax.add_patch(seoul_rect)
        ax.text(left_x + 11, y + 6.5,
                f"{pair['seoul']['tag']}\\n{pair['seoul']['hex']}",
                color=_contrast_color(pair['seoul']['hex']),
                fontsize=8, ha='center', va='center', weight='bold')
        ax.text(left_x + 11, y + 2.2,
                f"{pair['seoul']['element']} · {pair['seoul']['logic']}",
                color=_contrast_color(pair['seoul']['hex']),
                fontsize=7, ha='center')

        trad_rect = patches.FancyBboxPatch((right_x, y), 22, block_height,
                                           boxstyle='round,pad=0.6',
                                           facecolor=pair['trad']['hex'],
                                           edgecolor=DIVIDER, linewidth=1.0)
        ax.add_patch(trad_rect)
        ax.text(right_x + 11, y + 6.5,
                f"{pair['trad']['tag']}\\n{pair['trad']['hex']}",
                color=_contrast_color(pair['trad']['hex']),
                fontsize=8, ha='center', va='center', weight='bold')
        ax.text(right_x + 11, y + 2.2,
                f"{pair['trad']['element']} · {pair['trad']['logic']}",
                color=_contrast_color(pair['trad']['hex']),
                fontsize=7, ha='center')

        ax.annotate('', xy=(right_x - 2, y + block_height / 2),
                    xytext=(left_x + 22 + 2, y + block_height / 2),
                    arrowprops=dict(arrowstyle='->', color=ACCENT,
                                    lw=1.4, mutation_scale=18))
        ax.text((left_x + right_x) / 2 + 5, y + block_height / 2 + 2,
                'Seoul hit ➜ former anchor', color=GRAPHITE, fontsize=8, ha='center')

        ax.plot([left_x, 90], [y - 4, y - 4], color=DIVIDER, linewidth=0.6)

    ax.text(8, 10, 'Order: Wood→Metal → Fire→Water → Earth→Wood → Metal→Fire → Water→Earth',
            color=GRAPHITE, fontsize=8.5)

    plt.tight_layout()
    plt.savefig('preview.png', facecolor=PAPER_EDGE, dpi=300)


if __name__ == '__main__':
    draw_seoulism_blueprint()
