from libqtile import bar, widget, qtile
from libqtile.config import  Screen

from .colors import catppuccin

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    highlight_method = "line",
                    highlight_color = [catppuccin["blue"], catppuccin["blue"]],
                    background = catppuccin["background"],
                    inactive = catppuccin["black"],
                    borderwidth = 1,
                    padding=16,
                    fontsize=16
                    
                ),
                widget.WindowName(fontsize=14),
                widget.Prompt(fontsize=14),
                widget.Sep(foreground=catppuccin["foreground"]),
                widget.Systray(),
                widget.Wallpaper(
                    directory="~/Pictures/catppuccin/wallpapers/mandelbrot/",
                    random_selection=True,
                    label = "",
                ),
                widget.Sep(foreground=catppuccin["foreground"]),
                widget.Backlight(
                    brightness_file="/sys/class/backlight/intel_backlight/brightness",
                    max_brightness_file="/sys/class/backlight/intel_backlight/max_brightness",
                    fmt = "󱩓 {}",
                    fontsize=14,
                ),
                widget.Sep(foreground=catppuccin["foreground"]),
                widget.Battery(
                    format=" {char} {percent:2.0%} ",
                    charge_char="󰂄",
                    discharge_char="󰁺",
                    full_char="󱟢",
                    unknown_char="⚡",
                    empty_char="⁉️ ",
                    update_interval=2,
                    show_short_text=False,
                    default_text="",
                    fontsize=14,
                ),
                widget.Sep(foreground=catppuccin["foreground"]),
                widget.PulseVolume(
                    fmt = "󰕾 {}",
                    emoji = False,
                    mouse_callbacks = {"Button1" : lambda: qtile.spawn("alacritty -e pulsemixer")},
                    fontsize=14,
                ),
                widget.Sep(foreground=catppuccin["foreground"]),
                widget.Clock(
                    format="%Y-%m-%d %a %I:%M %p", 
                    fontsize=14,
                ),
            ],
            size=30,
            foreground = catppuccin["foreground"],
            background = catppuccin["background"],
            margin = 5,
        ),
    ),
]

