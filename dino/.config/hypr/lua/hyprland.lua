----------------------------
--[[ DF HYPRLAND CONFIG ]]--
----------------------------

-- PROGRAMS --
local terminal = "kitty"
local fileManager = "dolphin"
local menu = "rofi"
local drunArgs = "-show drun -replace -i"
local runArgs = "-show combi -modes combi -combi-modes \"drun,run\" -replace -i"
local filebrowserArgs = "-show combi -modes combi -combi-modes \"filebrowser,recursivebrowser\" -replace -i -matching regex"
local networkUI = "kitty -e nmtui"
local audioUI = "kitty -e pulsemixer"

-- MONITORS --
require("monitors")

-- ENVIRONMENT VARIABLES, DECORATIONS, AND ANIMATIONS --
require("aesthetics")

-- AUTOSTART --
hl.on("hyprland.start", function () 
  hl.exec_cmd("waybar")
  hl.exec_cmd("hyprpaper")
end)

-- KEYBINDINGS --
require("keybindings")
