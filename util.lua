function set_modal_box(modal_name, color)
    if (not modal_text) or (not modal_bg) then
        local main_screen = hs.screen.mainScreen()
        local main_screen_res = main_screen:fullFrame()
        local modal_bg_rect = hs.geometry.rect(main_screen_res.w-82,0,82,22)
        local modal_text_rect = hs.geometry.rect(main_screen_res.w-82,2,82,22)
        modal_bg = hs.drawing.rectangle(modal_bg_rect)
        modal_bg:setStroke(false)
        modal_bg:setLevel(hs.drawing.windowLevels.status)
        modal_bg:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces+hs.drawing.windowBehaviors.stationary)
        local styled_text = hs.styledtext.new("init...", {font={size=12.0, color=color.white}, paragraphStyle={alignment="center"}})
        modal_text = hs.drawing.text(modal_text_rect, styled_text)
        modal_text:setLevel(hs.drawing.windowLevels.status)
        modal_text:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces+hs.drawing.windowBehaviors.stationary)
        modal_bg:show()
        modal_text:show()
    end
    modal_bg:setFillColor(color)
    modal_text:setText(modal_name)
end

function _arrow_left()
    hs.eventtap.keyStroke(nil, "left", 0)
end

function _arrow_right()
    hs.eventtap.keyStroke(nil, "right", 0)
end

function _arrow_up()
    hs.eventtap.keyStroke(nil, "up", 0)
end

function _arrow_down()
    hs.eventtap.keyStroke(nil, "down", 0)
end

function _jump_start_word()
    hs.eventtap.keyStroke({"alt"}, "left", 0)
end

function _jump_end_word()
    hs.eventtap.keyStroke({"alt"}, "right", 0)
end

function _forward_delete()
    hs.eventtap.keyStroke(nil, "delete", 0)
end

function _back_delete()
    hs.eventtap.keyStroke(nil, "forwarddelete", 0)
end

function _forward_select_word()
    hs.eventtap.keyStroke({"alt","shift"}, "left", 0)
end

function _back_select_word()
    hs.eventtap.keyStroke({"alt","shift"}, "right", 0)
end

function _jump_to_start_of_line()
    hs.eventtap.keyStroke(nil, "home", 0)
end

function _jump_to_end_of_line()
    hs.eventtap.keyStroke(nil, "end", 0)
end