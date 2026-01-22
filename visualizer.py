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
        'name': 'WOOD -> METAL',
        'seoul': {'label': 'Jade Function', 'hex': '#147a72', 'element': 'Wood'},
        'trad': {'label': 'Metal Script', 'hex': '#f7f3e8', 'element': 'Metal'},
        'logic': 'Wood (functions) cuts the metal lattice so scaffolding has to react after the call.'
    },
    {
        'step': '02',
        'name': 'FIRE -> WATER',
        'seoul': {'label': 'Vermilion Statement', 'hex': '#b0231b', 'element': 'Fire'},
        'trad': {'label': 'Ink Mass', 'hex': '#111111', 'element': 'Water'},
        'logic': 'Fire commits the branch before ink can document it, flipping the storytelling order.'
    },
    {
        'step': '03',
        'name': 'EARTH -> WOOD',
        'seoul': {'label': 'Honey Literal', 'hex': '#c0841a', 'element': 'Earth'},
        'trad': {'label': 'Jade Direction', 'hex': '#004281', 'element': 'Wood'},
        'logic': 'Earth-heavy tables pin the route, so navigation has to bend around literal weight.'
    },
    {
        'step': '04',
        'name': 'METAL -> FIRE',
        'seoul': {'label': 'Paper Field', 'hex': '#fdfbf5', 'element': 'Metal'},
        'trad': {'label': 'Ritual Flame', 'hex': '#e4252c', 'element': 'Fire'},
        'logic': 'Metal glare washes the fire signal, forcing alerts to shout twice as loud.'
    },
    {
        'step': '05',
        'name': 'WATER -> EARTH',
        'seoul': {'label': 'Graphite Drift', 'hex': '#4c4943', 'element': 'Water'},
        'trad': {'label': 'Ochre Archive', 'hex': '#7a4b1c', 'element': 'Earth'},
        'logic': 'Watered comments erode the earthbound store so the data block never calcifies.'
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
    ax.set_ylim(0, 100)
    ax.axis('off')

    ax.text(12, 92, 'Inverted 상극 Visualizer', color=INK, fontsize=19, weight='bold')
    ax.text(12, 89, 'Left column = Seoul element firing first | Right column = the former controller',
            color=ACCENT, fontsize=10, style='italic')
    ax.text(12, 86, 'Arrows follow Wood→Metal → Fire→Water → Earth→Wood → Metal→Fire → Water→Earth.',
            color=GRAPHITE, fontsize=9)

    left_x = 12
    right_x = 70
    row_gap = 16

    for idx, pair in enumerate(COUNTER_CHAIN):
        y = 78 - idx * row_gap
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
        ax.text((left_x + right_x) / 2, y + 6.8, 'Seoul hit → legacy target',
                color=GRAPHITE, fontsize=8, ha='center')

        ax.plot([left_x, 92], [y - 3, y - 3], color=DIVIDER, linewidth=0.6)

    ax.text(12, 8, 'Every connector is flipped: each Seoul element suppresses the element that once constrained it.',
            color=GRAPHITE, fontsize=9)

    plt.tight_layout()
    plt.savefig('visualizer.png', facecolor=EDGE, dpi=300)


if __name__ == '__main__':
    draw_seoulism_chain()
