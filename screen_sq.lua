local function move_win(dir_name)
    local win = hs.window.focusedWindow()
    local screen = win:screen()
    if win then
        if dir_name == 'up' then win:moveOneScreenNorth()
        elseif dir_name == 'down' then win:moveOneScreenSouth()
        elseif dir_name == 'left' then win:moveOneScreenWest()
        elseif dir_name == 'right' then win:moveOneScreenEast()
        end
    end
end

local function resize_win(dir_name)
    local win = hs.window.focusedWindow()
    if win then
        local f = win:frame()
        local screen = win:screen()
        local max = screen:fullFrame()
        local stepw = max.w/30
        local steph = max.h/30
        if dir_name == "fullscreen" then f = max
        elseif dir_name == "halfright" then f.x = max.w/2 f.y = 0 f.w = max.w/2 f.h = max.h
        elseif dir_name == "halfleft" then f.x = 0 f.y = 0 f.w = max.w/2 f.h = max.h
        elseif dir_name == "halfup" then f.x = 0 f.y = 0 f.w = max.w f.h = max.h/2
        elseif dir_name == "halfdown" then f.x = 0 f.y = max.h/2 f.w = max.w f.h = max.h/2
        elseif dir_name == "right" then f.w = f.w+stepw
        elseif dir_name == "left" then f.w = f.w-stepw
        elseif dir_name == "up" then f.h = f.h-steph
        elseif dir_name == "down" then f.h = f.h+steph
        elseif dir_name == "cornerNE" then f.x = max.w/2 f.y = 0 f.w = max.w/2 f.h = max.h/2
        elseif dir_name == "cornerSE" then f.x = max.w/2 f.y = max.h/2 f.w = max.w/2 f.h = max.h/2
        elseif dir_name == "cornerNW" then f.x = 0 f.y = 0 f.w = max.w/2 f.h = max.h/2
        elseif dir_name == "cornerSW" then f.x = 0 f.y = max.h/2 f.w = max.w/2 f.h = max.h/2
        elseif dir_name == "center" then f.x = (max.w-f.w)/2 f.y = (max.h-f.h)/2
        elseif dir_name == "fcenter" then f.x = stepw*5 f.y = steph*5 f.w = stepw*20 f.h = steph*20
        elseif dir_name == "shrink" then f.x = f.x+stepw f.y = f.y+steph f.w = f.w-(stepw*2) f.h = f.h-(steph*2)
        elseif dir_name == "expand" then f.x = f.x-stepw f.y = f.y-steph f.w = f.w+(stepw*2) f.h = f.h+(steph*2)
        elseif dir_name == "mright" then f.x = f.x+stepw
        elseif dir_name == "mleft" then f.x = f.x-stepw
        elseif dir_name == "mup" then f.y = f.y-steph
        elseif dir_name == "mdown" then f.y = f.y+steph
        end
        win:setFrame(f)
    else
        hs.alert.show("[WARN] resize_win: No focused window!")
    end
end

function screen_sq(fnc)
    if fnc == "rf" then resize_win("fullscreen")
    elseif fnc == "rl" then resize_win("halfright")
    elseif fnc == "rh" then resize_win("halfleft")
    elseif fnc == "rj" then resize_win("halfdown")
    elseif fnc == "rk" then resize_win("halfup")
    end
end