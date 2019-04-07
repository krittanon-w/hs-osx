
-- setup restart hs key
hs.hotkey.bind({"ctrl", "alt", "cmd"}, getKeyCode("r"), 
    function()
        hs.reload()
    end
)

-- trigger Alfred
hs.hotkey.bind({"alt"}, getKeyCode("N"),
    function()
        switchToEN()
        hs.eventtap.keyStroke({"ctrl"}, getKeyCode("9"), 0)
    end
)
