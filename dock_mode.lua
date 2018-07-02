-- import
require("cmd_list")


-- init


-- main
dock_mode = hs.hotkey.modal.new()

function dock_mode:entered()
    modal_box("DOCK", color.black)
end

function dock_mode:exited()

end


-- arrow
dock_mode:bind({"alt"}, hs.keycodes.map["h"], function() _arrow_left() end, nil, function() _arrow_left() end)
dock_mode:bind({"alt"}, hs.keycodes.map["l"], function() _arrow_right() end, nil, function() _arrow_right() end)
dock_mode:bind({"alt"}, hs.keycodes.map["k"], function() _arrow_up() end, nil, function() _arrow_up() end)
dock_mode:bind({"alt"}, hs.keycodes.map["j"], function() _arrow_down() end, nil, function() _arrow_down() end)

-- edit word
dock_mode:bind({"alt"}, hs.keycodes.map["o"], function() _forward_select_word() _forward_delete() end)
dock_mode:bind({"alt", "shift"}, hs.keycodes.map["o"], function() _back_select_word() _forward_delete() end)
dock_mode:bind({"alt"}, hs.keycodes.map["i"], function() _forward_delete() end, nil, function() _forward_delete() end)
dock_mode:bind({"alt", "shift"}, hs.keycodes.map["i"], function() _back_delete() end, nil, function() _back_delete() end)

-- arrow jump
dock_mode:bind({"alt", "shift"}, hs.keycodes.map["h"], function() _jump_to_start_of_line() end)
dock_mode:bind({"alt", "shift"}, hs.keycodes.map["l"], function() _jump_to_end_of_line() end)

-- tab
dock_mode:bind({"alt"}, hs.keycodes.map["e"], nil, function() _next_tab()  end)
dock_mode:bind({"alt"}, hs.keycodes.map["w"], nil, function() _previous_tab() end)

dock_mode:bind({"alt"}, hs.keycodes.map["m"], function() _enter() end)

dock_mode:bind({"alt"}, hs.keycodes.map["f"], function() resize_win("fullscreen") end)


-- disable mininize and hide widows
dock_mode:bind({"cmd"}, hs.keycodes.map["m"], function() end)
dock_mode:bind({"cmd"}, hs.keycodes.map["h"], function() end)

-- auto switch language to EN when call alfred
dock_mode:bind({"alt"}, hs.keycodes.map["s"], function()
    hs.eventtap.keyStroke({"ctrl"}, "9", 0)
    _switch_to_EN()
end)

dock_mode:enter()




