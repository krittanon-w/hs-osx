-- setup default style of alert
alert_style = {
    strokeWidth = 0,
    strokeColor = { alpha = 0 },
    fillColor = { white = 0, alpha = 0.55 },
    radius = 4,
    textSize = 16,
    fadeInDuration = 0.15,
    fadeOutDuration = 0.15
}
for k, v in pairs(alert_style) do
    hs.alert.defaultStyle[k] = v
end

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
    purple = hs.drawing.color.x11.purple,
    osx_red = hs.drawing.color.osx_red,
    osx_green = hs.drawing.color.osx_green,
    osx_yellow = hs.drawing.color.osx_yellow
}