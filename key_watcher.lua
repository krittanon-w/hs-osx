local module = {}

local key_log = ""

module.eventwatcher = hs.eventtap.new({hs.eventtap.event.types.flagsChanged, hs.eventtap.event.types.keyDown},
    function(event)
        local flags = event:getFlags()
        key_log = key_log .. "[" .. hs.keycodes.map[event:getKeyCode()] .. "]"

        -- hs.printf(key_log)

        if string.sub(key_log, -24) == "[cmd][shift][cmd][shift]"
        --    or string.sub(key_log, -19) == "[cmd][shift][shift]"
        --    or string.sub(key_log, -33) == "[cmd][shift][shift][shift][shift]"
        then
            key_log = ""
            if(hs.keycodes.currentLayout() == "Thai")
            then
                hs.keycodes.setLayout("ABC")
            else
                hs.keycodes.setLayout("Thai")
            end
            hs.alert.closeAll()
            hs.alert.show("    " .. hs.keycodes.currentLayout() .. "    ", {textSize=15, radius=4}, 0.5);
        end
        return false
    end
):start()
