function switchToEN()
    hs.keycodes.setLayout("ABC")
end

function switchToTH()
    hs.keycodes.setLayout("Thai")
end

function getKeyCode(key)
    return hs.keycodes.map[key]
end

box = {}
function box:show(modal_name, color)
    if (not box_text) or (not box_bg) then
        main_screen = hs.screen.mainScreen()
        main_screen_res = main_screen:fullFrame()
        box_bg_rect = hs.geometry.rect(main_screen_res.w-112,0,112,22)
        box_text_rect = hs.geometry.rect(main_screen_res.w-112,2,112,22)
        box_bg = hs.drawing.rectangle(box_bg_rect)
        box_bg:setStroke(false)
        box_bg:setLevel(hs.drawing.windowLevels.popUpMenu)
        box_bg:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces+hs.drawing.windowBehaviors.stationary)
        local styled_text = hs.styledtext.new("init...", {font={size=12.0, color=color.white}, paragraphStyle={alignment="center"}})
        box_text = hs.drawing.text(box_text_rect, styled_text)
        box_text:setLevel(hs.drawing.windowLevels.popUpMenu)
        box_text:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces+hs.drawing.windowBehaviors.stationary)
        box_bg:show()
        box_text:show()
    end
    box_bg:setFillColor(color)
    box_text:setText(modal_name)
end

function box:delete()
    -- if (not box_text) or (not box_bg) then
        box_bg:hide()
        box_text:hide()
    -- end
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
