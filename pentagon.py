import matplotlib.pyplot as plt
import numpy as np
import matplotlib.patches as patches

def draw_systemic_divergence():
    # 1. Structural Data (User's definitive palette)
    elements = [
        {"id": "WOOD",  "trad": "#0000FF", "seoul": "#2AA394", "token": "c6"},
        {"id": "FIRE",  "trad": "#FF0000", "seoul": "#EA3C36", "token": "c1"},
        {"id": "EARTH", "trad": "#FFFF00", "seoul": "#F6C940", "token": "c3"}, # Index 2
        {"id": "METAL", "trad": "#FFFFFF", "seoul": "#ECECE9", "token": "fg"},
        {"id": "WATER", "trad": "#000000", "seoul": "#101114", "token": "bg"}
    ]
    polaris = {"id": "POLARIS", "trad": "#800080", "seoul": "#9C5FE8", "token": "c5"}

    # 2. Geometry
    radius = 1.0
    angles = np.linspace(np.pi/2, np.pi/2 - 2*np.pi, 6)[:-1]
    vertices = [(radius * np.cos(a), radius * np.sin(a)) for a in angles]

    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(20, 11), facecolor='#070709')

    def render_layer(ax, key, title, is_seoul=False):
        ax.set_facecolor('#070709')
        ax.set_xlim(-1.7, 1.7), ax.set_ylim(-1.7, 1.7), ax.axis('off')
        ax.set_title(title, color='#80858C', fontsize=18, fontweight='black', pad=40)

        # Cycles
        for i in range(5):
            ax.annotate("", xy=vertices[(i+1)%5], xytext=vertices[i],
                        arrowprops=dict(arrowstyle="-|>", lw=1.5, color='#242630', shrinkA=35, shrinkB=35))
            star_idx = [0, 2, 4, 1, 3, 0]
            ax.annotate("", xy=vertices[star_idx[i+1]], xytext=vertices[star_idx[i]],
                        arrowprops=dict(arrowstyle="->", lw=0.8, color='#373c44', linestyle=':', shrinkA=45, shrinkB=45))

        # Nodes
        for i, node in enumerate(elements):
            x, y = vertices[i]
            col = node[key]
            ax.add_patch(plt.Circle((x, y), 0.2, facecolor=col, edgecolor='#464e56', zorder=5))
            is_light = any(c in col.lower() for c in ['f', 'e', 'd'])
            ax.text(x, y, f"{node['id']}\n{node['token'] if is_seoul else ''}", 
                    ha='center', va='center', fontsize=9, fontweight='black', color='#101114' if is_light else '#ECECE9', zorder=6)

        # Polaris Core
        p_col = polaris[key]
        ax.add_patch(plt.Circle((0, 0), 0.25, facecolor=p_col, edgecolor='#BEBEBA', linewidth=1.5, zorder=10))
        ax.text(0, 0, f"{polaris['id']}\n{polaris['token'] if is_seoul else ''}".strip(), 
                ha='center', va='center', fontsize=10, fontweight='black', color='#ECECE9', zorder=11)

    render_layer(ax1, "trad", "CANONICAL PROTOCOL")
    render_layer(ax2, "seoul", "SEOULISM SYSTEM", is_seoul=True)

    # Traditional Earth (0,0) -> Seoulism Earth (vertices[2])
    target_idx = 2
    ax2.annotate("", xy=vertices[target_idx], xytext=(0, 0),
                 arrowprops=dict(arrowstyle="-|>", color='#ea3c36', lw=3, alpha=0.8, 
                                 shrinkA=30, shrinkB=25), zorder=12)

    ax2.text(vertices[target_idx][0]*0.5, vertices[target_idx][1]*0.5 - 0.2, 
             "RELOCATION\nVECTOR", color='#ea3c36', fontsize=12, fontweight='black', 
             ha='center', va='top', bbox=dict(facecolor='#070709', edgecolor='none', alpha=0.9), zorder=13)

    plt.figtext(0.5, 0.05, "DIVERGENCE: THE EARTH(c3) DISPLACED FROM THE CENTER AXIS", 
                color='#80858C', fontsize=12, ha='center', fontweight='bold')

    plt.savefig('pentagon_cycle.png', facecolor='#070709', dpi=300, bbox_inches='tight')
    plt.show()

if __name__ == "__main__":
    draw_systemic_divergence()
