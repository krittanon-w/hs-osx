-- Config
hs.hotkey.alertDuration = 0
hs.hints.showTitleThresh = 0
hs.window.animationDuration = 0

-- defind

color = {
    white = hs.drawing.color.white,
    black = hs.drawing.color.black,
    red = hs.drawing.color.red,
    green = hs.drawing.color.green,
    blue = hs.drawing.color.blue,
    osx_red = hs.drawing.color.osx_red,
    osx_green = hs.drawing.color.osx_green,
    osx_yellow = hs.drawing.color.osx_yellow
}

if not module_list then
    module_list = {
        'util',
        'dock_mode'
    }
end

for i=1,#module_list do
    require(module_list[i])
end