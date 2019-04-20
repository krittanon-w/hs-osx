function switchToEN()
    hs.keycodes.setLayout("ABC")
end

function switchToTH()
    hs.keycodes.setLayout("Thai")
end

function getKeyCode(key)
    return hs.keycodes.map[key]
end

function alert(text)
    hs.alert.show(text)
end

function disableAllKey(modal)
    local key_list = {
        "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", "=",
        "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
        "[", "]", "\\", ";", "'", ",", ".", "/",
        "`", "tab", "spacebar", "return", "delete"
    }
    for k, v in pairs(key_list) do
        modal:bind(nil, getKeyCode(v),
            function()
                -- hs.printf("key [" .. key_list[i] .. "] has disabled on this mode")
                hs.alert.closeAll()
                hs.alert.show("THIS KEY IS DISABLED")
            end,
            function()
                hs.alert.closeAll()
            end
        )
    end
end

function beep(volume)
    volume = volume or 1.0
    local file = "/System/Library/Sounds/Submarine.aiff"
    local sould = hs.sound.getByFile(file)
    sould:volume(volume)
    sould:play()
end
