import matplotlib.pyplot as plt
import matplotlib.patches as patches

PAPER = '#f2f0ed'
PAPER_EDGE = '#f8f6f4'
INK = '#25231f'
GRAPHITE = '#403d36'
DIVIDER = '#d5d0ca'
ACCENT = '#a81813'

COUNTER_CHAIN = [
    {
        'step': '01',
        'pair': 'METAL -> WOOD',
        'seoul': {'tag': 'Alloy Function', 'hex': '#8a8f9f', 'element': 'Metal', 'logic': 'Compile / Frame'},
        'trad': {'tag': 'Jade Route', 'hex': '#147a72', 'element': 'Wood', 'logic': 'Declare / Growth'},
        'note': 'Metal-coded functions now clamp the jade routes, forcing Wood declarations to sprout after the machinery.'
    },
    {
        'step': '02',
        'pair': 'WATER -> FIRE',
        'seoul': {'tag': 'Graphite Statement', 'hex': GRAPHITE, 'element': 'Water', 'logic': 'Branch / Drift'},
        'trad': {'tag': 'Ritual Flame', 'hex': '#e4252c', 'element': 'Fire', 'logic': 'Signal / Rite'},
        'note': 'Water now floods the ritual flame, so Fire warnings have to burn through soot to be seen.'
    },
    {
        'step': '03',
        'pair': 'WOOD -> EARTH',
        'seoul': {'tag': 'Indigo Literal', 'hex': '#2949bf', 'element': 'Wood', 'logic': 'Data / Vines'},
        'trad': {'tag': 'Honey Bedrock', 'hex': '#c0841a', 'element': 'Earth', 'logic': 'Store / Weight'},
        'note': 'Wood-toned literals creep through the ochre bedrock so the storage layer has to absorb movement.'
    },
    {
        'step': '04',
        'pair': 'FIRE -> METAL',
        'seoul': {'tag': 'Ritual Type', 'hex': '#a81813', 'element': 'Fire', 'logic': 'Structure / Heat'},
        'trad': {'tag': 'Paper Field', 'hex': PAPER, 'element': 'Metal', 'logic': 'Stage / Surface'},
        'note': 'Fire-bright types scar the metal grid, so the paper field has to recover after each declaration.'
    },
    {
        'step': '05',
        'pair': 'EARTH -> WATER',
        'seoul': {'tag': 'Ochre Annotation', 'hex': '#745a26', 'element': 'Earth', 'logic': 'Context / Memory'},
        'trad': {'tag': 'Ink Basin', 'hex': '#111111', 'element': 'Water', 'logic': 'Void / Archive'},
        'note': 'Earthy annotations now cake over the ink basin so Water documentation has to seep upward.'
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
    ax.set_ylim(0, 140)
    ax.axis('off')

    ax.text(8, 133, 'SEOULISM COUNTER-CHAIN BLUEPRINT', color=INK, fontsize=20, weight='bold')
    ax.text(8, 129, 'Every role moved into its opposite seat; tradition is now the one being answered.',
            color=ACCENT, fontsize=10, style='italic')

    row_height = 24
    block_height = 10
    left_x = 10
    right_x = 58

    for idx, pair in enumerate(COUNTER_CHAIN):
        y = 108 - idx * row_height
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
                f"{pair['seoul']['tag']}\n{pair['seoul']['hex']}",
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
                f"{pair['trad']['tag']}\n{pair['trad']['hex']}",
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
        ax.text((left_x + 22 + right_x) / 2, y + block_height / 2 + 2,
                'Swapped seat ➜ displaced anchor', color=GRAPHITE, fontsize=8, ha='center')

        ax.plot([left_x, 90], [y - 4, y - 4], color=DIVIDER, linewidth=0.6)

    ax.text(8, 1.5, 'Order: Metal→Wood → Water→Fire → Wood→Earth → Fire→Metal → Earth→Water',
            color=GRAPHITE, fontsize=8.5)

    plt.tight_layout()
    plt.savefig('preview.png', facecolor=PAPER_EDGE, dpi=300)


if __name__ == '__main__':
    draw_seoulism_blueprint()
