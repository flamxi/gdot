from libqtile import layout

from .colors import catppuccin

layouts = [
    layout.MonadTall(border_focus=catppuccin["yellow"], border_normal=catppuccin["magenta"], margin=3),
    layout.Max(),
]
