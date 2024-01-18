from libqtile import layout

from .colors import *

# --------------------------------------------------------
# Setup Layout Theme
# --------------------------------------------------------

layout_theme = {
    "border_width": 3,
    "margin": 10,
    "border_focus": Color2,
    "border_normal": "FFFFFF",
    "single_border_width": 3
}

# --------------------------------------------------------
# Layouts
# --------------------------------------------------------

layouts = [
    layout.Max(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
]
