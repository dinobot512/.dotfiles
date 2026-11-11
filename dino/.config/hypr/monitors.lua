--[[ MONITORS ]]--
-- https://wiki.hypr.land/Configuring/Basics/Monitors/

local file = io.open("/etc/hostname", "r")
local hostname = file and file:read("*l") or ""
if file then file:close() end

if hostname == "df-medo" then
    hl.monitor({
        output = "DP-1",
        mode = "1920x1080@165.00",
        position = "0x0",
        scale = 1,
    })

    hl.monitor({
        output = "HDMI-A-1",
        mode = "1920x1080@74.97",
        position = "1920x0",
        scale = 1,
    })

    hl.workspace_rule({ workspace = "1", monitor = "DP-1",     default = true })
    hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1", default = true })

elseif hostname == "df-zeko" then
    hl.monitor({
        output = "eDP-1",
        mode = "preferred",
        position = "auto",
        scale = 1,
    })

    hl.workspace_rule({ workspace = "1", monitor = "eDP-1",    default = true })

    hl.monitor({
        output = "",
        mode = "preferred",
        position = "auto",
        scale = 1,
        mirror = "eDP-1",
    })

else
    hl.monitor({
        output = "",
        mode = "preferred",
        position = "auto",
        scale = 1,
    })
end
