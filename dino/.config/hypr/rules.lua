--[[ WINDOW and WORKSPACE RULES ]]--

-- WINDOW RULES --
-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(true)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "thunderbird-compose-float",
    match = { initial_class = "org.mozilla.Thunderbird", initial_title = "^(Write.*)$" },
    float = true,
})

hl.window_rule({
    name  = "thunderbird-edit-item-float",
    match = { initial_class = "org.mozilla.Thunderbird", initial_title = "Edit Item" },
    float = true,
})

hl.window_rule({
    name        = "wolfram-notebook-float",
    match       = { initial_class = "com.wolfram.Wolfram.15.0", initial_title = "WolframNB" },
    float       = true,
    border_size = 0,
})

hl.window_rule({
    -- Windows on the special workspace (scratchpad) float
    name  = "special-workspace-float",
    match = { workspace = "s[true]" },
    float = true,
})

-- "Smart gaps" / "No gaps when only"
-- NOTE: w[tv1] = workspaces with one tiled visible window
-- NOTE: f[1] = workspaces with maximized window
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, border_size = 0 })
hl.window_rule({ match = { float = true }, border_size = 1 })

-- XWAYLAND --
hl.config({
    xwayland = {
        enabled            = true,
        force_zero_scaling = true,
    },
})
