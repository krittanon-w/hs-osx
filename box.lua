local obj = {}
obj.__index = obj
obj.bg = nil
obj.text = nil

function obj:show(text, color)
    obj.bg:setFillColor({hex = color})
    obj.text:setText(text)
    obj.bg:show()
    obj.text:show()
end

function obj:hide()
    obj.bg:hide()
    obj.text:hide()
end

function obj:new(name, color)
    obj.bg = nil
    obj.text = nil

    local cscreen = hs.screen.mainScreen()
    local cframe = cscreen:fullFrame()
    
    local bg_rect = hs.geometry.rect(cframe.w-112, 0, 112, 22)
    local bg = hs.drawing.rectangle(bg_rect)
    bg:setStroke(false)
    bg:setLevel(hs.drawing.windowLevels.popUpMenu)
    bg:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces + hs.drawing.windowBehaviors.stationary)
    

    local text_rect = hs.geometry.rect(cframe.w-112, 2, 112, 22)
    local text_style = hs.styledtext.new("default", {font={size=12.0, color={hex = "#FFFFFF"}}, paragraphStyle={alignment="center"}})
    local text = hs.drawing.text(text_rect, text_style)
    text:setLevel(hs.drawing.windowLevels.popUpMenu)
    text:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces+hs.drawing.windowBehaviors.stationary)


    obj.text = text
    obj.bg = bg

    return obj
end

return obj