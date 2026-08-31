----------------------------
--[[ DF HYPRLAND CONFIG ]]--
----------------------------

-- PROGRAMS --
terminal = "kitty"
fileManager = "dolphin"
menu = "rofi"
networkUI = "kitty -e nmtui"
audioUI = "kitty -e pulsemixer"

-- KEYBINDINGS --
require("keybindings")


-- MONITORS --
require("monitors")

-- ENVIRONMENT VARIABLES, DECORATIONS, AND ANIMATIONS --
require("aesthetics")

-- AUTOSTART --
hl.on("hyprland.start", function () 
  hl.exec_cmd("waybar")
  hl.exec_cmd("hyprpaper")
end)


