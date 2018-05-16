-- Config
hs.hotkey.alertDuration = 0
hs.hints.showTitleThresh = 0
hs.window.animationDuration = 0

-- defind global var
color = {
    white = hs.drawing.color.white,
    black = hs.drawing.color.black,
    red = hs.drawing.color.red,
    green = hs.drawing.color.green,
    blue = hs.drawing.color.blue,
    osx_red = hs.drawing.color.osx_red,
    osx_green = hs.drawing.color.osx_green,
    osx_yellow = hs.drawing.color.osx_yellow,
    purple = hs.drawing.color.x11.purple
}

-- include files
if not module_list then
    module_list = {
        "functions",
        "dock_mode",
        "cmd_mode",
        "test_mode",
        -- "debug_mode",
        -- "mouse_mode",
        "key_watcher"
    }
end

for i=1, #module_list do
    require(module_list[i])
end


-- disable cmd h
-- hs.hotkey.bind({"cmd"}, hs.keycodes.map["h"], function() end)