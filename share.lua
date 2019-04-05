function switchToEN()
    hs.keycodes.setLayout("ABC")
end

function switchToTH()
    hs.keycodes.setLayout("Thai")
end

function getKeyCode(key)
    return hs.keycodes.map[key]
end

function box(modal_name, color)
    if (not modal_text) or (not modal_bg) then
        local main_screen = hs.screen.mainScreen()
        local main_screen_res = main_screen:fullFrame()
        local modal_bg_rect = hs.geometry.rect(main_screen_res.w-82,0,82,22)
        local modal_text_rect = hs.geometry.rect(main_screen_res.w-82,2,82,22)
        modal_bg = hs.drawing.rectangle(modal_bg_rect)
        modal_bg:setStroke(false)
        modal_bg:setLevel(hs.drawing.windowLevels.popUpMenu)
        modal_bg:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces+hs.drawing.windowBehaviors.stationary)
        local styled_text = hs.styledtext.new("init...", {font={size=12.0, color=color.white}, paragraphStyle={alignment="center"}})
        modal_text = hs.drawing.text(modal_text_rect, styled_text)
        modal_text:setLevel(hs.drawing.windowLevels.popUpMenu)
        modal_text:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces+hs.drawing.windowBehaviors.stationary)
        modal_bg:show()
        modal_text:show()
    end
    modal_bg:setFillColor(color)
    modal_text:setText(modal_name)
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
