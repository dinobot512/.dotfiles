----------------------------
--[[ DF HYPRLAND CONFIG ]]--
----------------------------

-- PROGRAMS --
Terminal = "kitty"
FileManager = "dolphin"
Menu = "rofi"
NetworkUI = "kitty -e nmtui"
AudioUI = "kitty -e pulsemixer"

-- KEYBINDINGS --
require("keybindings")

-- INPUT --
hl.config({
    input = {
        kb_options = "caps:swapescape",
        touchpad = {
            natural_scroll = true,
        },
    },
})

-- MONITORS --
require("monitors")

-- ENVIRONMENT VARIABLES, DECORATIONS, AND ANIMATIONS --
require("aesthetics")

-- AUTOSTART --
hl.on("hyprland.start", function ()
  hl.exec_cmd("waybar")
  hl.exec_cmd("hyprpaper")
end)
