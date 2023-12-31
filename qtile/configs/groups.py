from libqtile.config import Group, Match
    
from .globals import terminal, browser

group_indexes = "12345"

groups = [
    Group("", layout="monadtall", spawn=terminal),
    Group("", layout="monadtall", spawn=terminal),
    Group("", 
          layout="monadtall", 
          spawn=browser, 
          matches=[Match(wm_class=[browser])],
    ),
    Group(
        "󰒱", 
        layout="monadtall", 
        spawn=["slack", "discord", "teams-for-linux"], 
        matches=[
          Match(wm_class=["slack"]),
          Match(wm_class=["discord"]),
          Match(wm_class=["teams-for-linux"]),
        ],
    ),
    Group("", 
          layout="max", 
          spawn="spotify", 
          matches=[Match(wm_class=["spotify"])],
    ),
]
