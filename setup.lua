
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
hs.hotkey.bind({"cmd"}, getKeyCode("M"),
    function()
        switchToEN()
        hs.hints.windowHints()
    end
)