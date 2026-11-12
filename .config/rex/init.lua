-- Migrated from tmux (prefix ctrl+a), Alacritty, Ghostty and iTerm2.
-- cmd+k keeps Rex's session picker (by user decision, choice 1).

local prefix = "ctrl+a" 
local function pbind(key, action, args) 
    rex.bind(prefix .. ">" .. key, action, args)
end

pbind("c", "client.tab.new")
pbind("shift+5", "pane.split", { direction = "right" })
pbind("shift+'", "pane.split", { direction = "down" })

-- ~/.tmux.conf:10-13 bind -n M-h/l/k/j select-pane
rex.bind("alt+h", "pane.focus", { direction = "left" })
rex.bind("alt+l", "pane.focus", { direction = "right" })
rex.bind("alt+k", "pane.focus", { direction = "up" })
rex.bind("alt+j", "pane.focus", { direction = "down" })

-- ~/.tmux.conf:22-25 bind -n C-h/j/k/l resize-pane 1
rex.bind("ctrl+h", "pane.resize", { amount = 1, direction = "left" })
rex.bind("ctrl+j", "pane.resize", { amount = 1, direction = "down" })
rex.bind("ctrl+k", "pane.resize", { amount = 1, direction = "up" })
rex.bind("ctrl+l", "pane.resize", { amount = 1, direction = "right" })
