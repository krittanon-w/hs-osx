debug_mode = hs.hotkey.modal.new()

local keys_watcher = nil
local apps_watcher = nil 

function debug_mode:entered()
    modal_box("DEBUG", color.purple)
    keys_watcher:start()
    apps_watcher:start()
end

function debug_mode:exited()
    keys_watcher:stop()
    apps_watcher:stop()
end

local key_events = { 
    hs.eventtap.event.types.keyUp, 
    hs.eventtap.event.types.flagsChanged
}

keys_watcher = keys_watcher or hs.eventtap.new(key_events, function(event)
    local key_code = event:getKeyCode()
    local key_char = hs.keycodes.map[key_code]
    hs.printf("[" .. key_code .. ", " .. key_char .. "]")
    return false
end)

apps_watcher = apps_watcher or hs.application.watcher.new(function(app_name, app_event, app)
    hs.printf("app " .. app_name)
    hs.printf("event " .. app_event)
end)

hs.hotkey.bind({"alt", "cmd"}, hs.keycodes.map["d"], function() debug_mode:enter() end)

debug_mode:bind(nil, "escape", function() 
    debug_mode:exit() 
    dock_mode:enter()
end)