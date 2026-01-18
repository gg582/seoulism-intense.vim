import matplotlib.pyplot as plt
import numpy as np
import matplotlib as mpl

mpl.rcParams['font.family'] = 'Noto Sans CJK KR'
mpl.rcParams['axes.unicode_minus'] = False # To prevent minus signs from breaking with Korean fonts

PAPER = '#fdfbf5'
EDGE = '#f1ebdd'
INK = '#111111'
GRAPHITE = '#4c4943'
PAIR_ARROW = '#b0231b'
STAR_ARROW = '#2f3b8f'
NODE_OUTLINE = '#bfae95'

ELEMENTS = [
    ('WOOD',  '#0000FF', '#147a72', 'Counter Metal'),
    ('FIRE',  '#FF0000', '#b0231b', 'Counter Water'),
    ('EARTH', '#FFFF00', '#c0841a', 'Counter Void'),
    ('METAL', '#FFFFFF', '#fdfbf5', 'Counter Wood'),
    ('WATER', '#000000', '#111111', 'Counter Fire'),
]

COUNTER_PAIRS = [(0, 3), (1, 4), (2, 0), (3, 1), (4, 2)]


def _contrast(color: str) -> str:
    r = int(color[1:3], 16)
    g = int(color[3:5], 16)
    b = int(color[5:7], 16)
    brightness = 0.2126 * r + 0.7152 * g + 0.0722 * b
    return INK if brightness > 160 else '#fdfbf5'


def draw_systemic_divergence():
    radius = 1.0
    angles = np.linspace(np.pi / 2, np.pi / 2 - 2 * np.pi, 6)[:-1]
    vertices = [(radius * np.cos(a), radius * np.sin(a)) for a in angles]

    fig, ax = plt.subplots(figsize=(10, 10), facecolor=EDGE)
    ax.set_facecolor(PAPER)
    ax.set_xlim(-1.8, 1.8)
    ax.set_ylim(-1.8, 1.8)
    ax.axis('off')

    ax.set_title('Counter-Rotation Map', color=INK,
                 fontsize=18, fontweight='bold', pad=24)

    for start, end in COUNTER_PAIRS:
        ax.annotate('', xy=vertices[end], xytext=vertices[start],
                    arrowprops=dict(arrowstyle='-|>', color=PAIR_ARROW,
                                    lw=1.8, shrinkA=20, shrinkB=20))

    star = [0, 2, 4, 1, 3, 0]
    for i in range(len(star) - 1):
        ax.annotate('', xy=vertices[star[i + 1]], xytext=vertices[star[i]],
                    arrowprops=dict(arrowstyle='->', color=STAR_ARROW,
                                    lw=1.0, linestyle=':', shrinkA=25, shrinkB=25))

    for idx, (name, trad, seoul, note) in enumerate(ELEMENTS):
        x, y = vertices[idx]
        ax.add_patch(plt.Circle((x, y), 0.22, facecolor=seoul,
                                edgecolor=NODE_OUTLINE, linewidth=1.0))
        label = f"{name}\n{note}"
        ax.text(x, y + 0.28, label, ha='center', va='center', fontsize=9,
                color=GRAPHITE, fontweight='bold')
        ax.text(x, y, seoul, ha='center', va='center', fontsize=8,
                color=_contrast(seoul), fontweight='bold')
        ax.text(x, y - 0.3, trad + ' trad', ha='center', va='center', fontsize=7,
                color=GRAPHITE)

    ax.text(0, -1.5, 'Red arrows = Counter-Rotation pairs (modern hit) | Dotted star = tradition order',
            color=GRAPHITE, fontsize=9, ha='center')

    plt.savefig("pentagon_cycle.png")
    plt.show()


if __name__ == '__main__':
    draw_systemic_divergence()
