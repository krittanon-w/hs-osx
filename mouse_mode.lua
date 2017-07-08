
local function click()
    -- local cmd = "cliclick c:+0,+0"
    local cmd = "/usr/local/bin/cliclick c:+0,+0"
    local printout = hs.execute(cmd)
    return printout
end

mouse_positon_before = {
    x = -1,
    y = -1
}

move_event = move_event or hs.eventtap.new({ hs.eventtap.event.types.mouseMoved },
    function(event)
            local dx = event:getProperty(hs.eventtap.event.properties.mouseEventDeltaX)
            local dy = event:getProperty(hs.eventtap.event.properties.mouseEventDeltaY)
            local current_mouse_position = hs.mouse.getRelativePosition()

            if (math.abs(mouse_positon_before.x - current_mouse_position.x) > 500) then
                hs.printf('Screen changed')
                hs.timer.doAfter(0.15,
                    function()
                        click()
                    end
                )
                -- hs.osascript.applescript('display notification "hello" & return')
            end
            -- hs.printf('x ' .. current_mouse_position.x ..', y ' .. current_mouse_position.y)
            mouse_positon_before.x = current_mouse_position.x
            mouse_positon_before.y = current_mouse_position.y
    end
)

move_event:start()