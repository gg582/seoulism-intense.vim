import matplotlib.pyplot as plt
import numpy as np
import matplotlib.patches as patches

def draw_systemic_divergence():
    # 1. Structural Data (User's definitive palette)
    elements = [
        {"id": "WOOD",  "trad": "#0000FF", "seoul": "#3aa39a", "token": "c6"},
        {"id": "FIRE",  "trad": "#FF0000", "seoul": "#e05a55", "token": "c1"},
        {"id": "EARTH", "trad": "#FFFF00", "seoul": "#e5c15a", "token": "c3"}, # Index 2
        {"id": "METAL", "trad": "#FFFFFF", "seoul": "#d8d7d2", "token": "fg"},
        {"id": "WATER", "trad": "#000000", "seoul": "#181a1f", "token": "bg"}
    ]

    # 2. Geometry
    radius = 1.0
    angles = np.linspace(np.pi/2, np.pi/2 - 2*np.pi, 6)[:-1]
    vertices = [(radius * np.cos(a), radius * np.sin(a)) for a in angles]

    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(20, 11), facecolor='#121318')

    def render_layer(ax, key, title, is_seoul=False):
        ax.set_facecolor('#121318')
        ax.set_xlim(-1.7, 1.7), ax.set_ylim(-1.7, 1.7), ax.axis('off')
        ax.set_title(title, color='#8f959c', fontsize=18, fontweight='black', pad=40)

        # Cycles
        for i in range(5):
            ax.annotate("", xy=vertices[(i+1)%5], xytext=vertices[i],
                        arrowprops=dict(arrowstyle="-|>", lw=1.5, color='#2b2e36', shrinkA=35, shrinkB=35))
            star_idx = [0, 2, 4, 1, 3, 0]
            ax.annotate("", xy=vertices[star_idx[i+1]], xytext=vertices[star_idx[i]],
                        arrowprops=dict(arrowstyle="->", lw=0.8, color='#4f555d', linestyle=':', shrinkA=45, shrinkB=45))

        # Nodes
        for i, node in enumerate(elements):
            x, y = vertices[i]
            col = node[key]
            ax.add_patch(plt.Circle((x, y), 0.2, facecolor=col, edgecolor='#5f6770', zorder=5))
            is_light = any(c in col.lower() for c in ['f', 'e', 'd'])
            ax.text(x, y, f"{node['id']}\n{node['token'] if is_seoul else ''}", 
                    ha='center', va='center', fontsize=9, fontweight='black', color='#181a1f' if is_light else '#d8d7d2', zorder=6)

    render_layer(ax1, "trad", "CANONICAL PROTOCOL")
    render_layer(ax2, "seoul", "SEOULISM SYSTEM", is_seoul=True)

    plt.figtext(0.5, 0.05, "DIVERGENCE: Color dimmed, no hierarchy between colors", 
                color='#8f959c', fontsize=12, ha='center', fontweight='bold')

    plt.savefig('pentagon_cycle.png', facecolor='#121318', dpi=300, bbox_inches='tight')
    plt.show()

if __name__ == "__main__":
    draw_systemic_divergence()
