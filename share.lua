function move_win(mode)
    local win = hs.window.focusedWindow()
    local screen = win:screen()
    if win then
        if mode == 'up' then win:moveOneScreenNorth()
        elseif mode == 'down' then win:moveOneScreenSouth()
        elseif mode == 'left' then win:moveOneScreenWest()
        elseif mode == 'right' then win:moveOneScreenEast()
        end
    end
end

function resize_win(mode)
    local win = hs.window.focusedWindow()
    if win then
        local f = win:frame()
        local screen = win:screen()
        local max = screen:fullFrame()
        local stepw = max.w/30
        local steph = max.h/30
        if mode == "fullscreen" then f = max
        elseif mode == "halfright" then f.x = max.w/2 f.y = 0 f.w = max.w/2 f.h = max.h
        elseif mode == "halfleft" then f.x = 0 f.y = 0 f.w = max.w/2 f.h = max.h
        elseif mode == "halfup" then f.x = 0 f.y = 0 f.w = max.w f.h = max.h/2
        elseif mode == "halfdown" then f.x = 0 f.y = max.h/2 f.w = max.w f.h = max.h/2
        elseif mode == "right" then f.w = f.w+stepw
        elseif mode == "left" then f.w = f.w-stepw
        elseif mode == "up" then f.h = f.h-steph
        elseif mode == "down" then f.h = f.h+steph
        elseif mode == "cornerNE" then f.x = max.w/2 f.y = 0 f.w = max.w/2 f.h = max.h/2
        elseif mode == "cornerSE" then f.x = max.w/2 f.y = max.h/2 f.w = max.w/2 f.h = max.h/2
        elseif mode == "cornerNW" then f.x = 0 f.y = 0 f.w = max.w/2 f.h = max.h/2
        elseif mode == "cornerSW" then f.x = 0 f.y = max.h/2 f.w = max.w/2 f.h = max.h/2
        elseif mode == "center" then f.x = (max.w-f.w)/2 f.y = (max.h-f.h)/2
        elseif mode == "fcenter" then f.x = stepw*5 f.y = steph*5 f.w = stepw*20 f.h = steph*20
        elseif mode == "shrink" then f.x = f.x+stepw f.y = f.y+steph f.w = f.w-(stepw*2) f.h = f.h-(steph*2)
        elseif mode == "expand" then f.x = f.x-stepw f.y = f.y-steph f.w = f.w+(stepw*2) f.h = f.h+(steph*2)
        elseif mode == "mright" then f.x = f.x+stepw
        elseif mode == "mleft" then f.x = f.x-stepw
        elseif mode == "mup" then f.y = f.y-steph
        elseif mode == "mdown" then f.y = f.y+steph
        end
        win:setFrame(f)
    else
        hs.alert.show("[WARN] resize_win: No focused window!")
    end
end

function modal_box(modal_name, color)
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

function disable_all_keys(mode)
    local key_list = {
        "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
        "[","]",";","'",",",".","/",
        "1","2","3","4","5","6","7","8","9","0","-","=",
        "tab"
    }
    for i = 1, #key_list do
        mode:bind(nil, hs.keycodes.map[key_list[i]],
            function()
                -- hs.printf("key [" .. key_list[i] .. "] has disabled on this mode")
                hs.alert.closeAll()
                hs.alert.show("DISABLED KEY",{textSize=15, radius=4});
            end,
            function()
                hs.alert.closeAll()
            end
        )
        mode:bind({"shift"}, hs.keycodes.map[key_list[i]],
            function()
                -- hs.printf("key [shift + " .. key_list[i] .. "] has disabled on this mode")
                hs.alert.closeAll()
                hs.alert.show("DISABLED KEY",{textSize=15, radius=4});
            end,
            function()
                hs.alert.closeAll()
            end
        )
    end
end

function print_table(tbl)
    for k, v in pairs(tbl) do
        hs.printf(k .. " = " ..v)
    end
end

function arrow_left()
    hs.eventtap.keyStroke(nil, "left", 0)
end

function arrow_right()
    hs.eventtap.keyStroke(nil, "right", 0)
end

function arrow_up()
    hs.eventtap.keyStroke(nil, "up", 0)
end

function arrow_down()
    hs.eventtap.keyStroke(nil, "down", 0)
end

function jump_start_word()
    hs.eventtap.keyStroke({"alt"}, "left", 0)
end

function jump_end_word()
    hs.eventtap.keyStroke({"alt"}, "right", 0)
end

function forward_delete()
    hs.eventtap.keyStroke(nil, "delete", 0)
end

function back_delete()
    hs.eventtap.keyStroke(nil, "forwarddelete", 0)
end

function forward_select_word()
    hs.eventtap.keyStroke({"alt","shift"}, "left", 0)
end

function back_select_word()
    hs.eventtap.keyStroke({"alt","shift"}, "right", 0)
end

function jump_to_start_of_line()
    hs.eventtap.keyStroke({"cmd"}, "left", 0)
end

function jump_to_end_of_line()
    hs.eventtap.keyStroke({"cmd"}, "right", 0)
end

function escape()
    hs.eventtap.keyStroke(nil, "escape", 0)
end

function enter()
    hs.eventtap.keyStroke(nil, "return", 0)
end

function switch_to_en()
    hs.keycodes.setLayout("ABC")
end

function switch_to_th()
    hs.keycodes.setLayout("Thai")
end

function next_tab()
    hs.eventtap.keyStroke({"ctrl"}, "tab", 0)
end

function previous_tab()
    hs.eventtap.keyStroke({"ctrl", "shift"}, "tab", 0)
end