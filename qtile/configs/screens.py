from libqtile import bar, widget, qtile
from libqtile.config import  Screen

from .colors import catppuccin
from pathlib import Path

home = str(Path.home())

screens = [

Screen(
      top=bar.Gap(50),
  ),
]

