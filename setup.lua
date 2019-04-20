
-- setup restart hs key
hs.hotkey.bind({"ctrl", "alt", "cmd"}, getKeyCode("R"), 
    function()
        switchToEN()
        hs.reload()
    end
)

-- trigger Alfred
hs.hotkey.bind({"cmd"}, getKeyCode("N"),
    function()
        switchToEN()
        hs.eventtap.keyStroke({"ctrl"}, getKeyCode("9"), 0)
    end
)

-- trigger windowHints
hs.hints.fontSize = "14"
hs.hints.style = "vimperator"
hs.hotkey.bind({"cmd"}, getKeyCode("D"),
    function()
        switchToEN()
        hs.hints.windowHints()
    end
)

-- triger bluetooth every 15 min
local time = 15 -- minus
hs.timer.doEvery(time * 60, function() beep(0.20) end)