----------------------------
--[[ DF HYPRLAND CONFIG ]]--
----------------------------

-- PROGRAMS --
Terminal = "kitty"
FileManager = Terminal .. " -e yazi"
Menu = "rofi"
NetworkUI = "kitty -e nmtui"
AudioUI = "kitty -e pulsemixer"

-- KEYBINDINGS --
require("keybindings")

-- INPUT --
hl.config({
    input = {
        kb_options = "caps:swapescape",
    },
})

-- MONITORS --
require("monitors")

-- ENVIRONMENT VARIABLES, DECORATIONS, AND ANIMATIONS --
require("aesthetics")

require("rules")

-- AUTOSTART --
hl.on("hyprland.start", function ()
  hl.exec_cmd("waybar")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("xrandr --output DP-1 --primary")
end)
