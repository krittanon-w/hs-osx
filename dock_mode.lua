dock_mode = hs.hotkey.modal.new()

function dock_mode:entered()
    modal_box("DOCK", color.black)
end

function dock_mode:exited()
    -- modal_stat("", color.red)
end

-- dock_mode:bind(nil, "escape"], function() dock_mode:exit() end)
dock_mode:bind({"alt"}, hs.keycodes.map["h"], function() _arrow_left() end, nil, function() _arrow_left() end)
dock_mode:bind({"alt"}, hs.keycodes.map["l"], function() _arrow_right() end, nil, function() _arrow_right() end)
dock_mode:bind({"alt"}, hs.keycodes.map["k"], function() _arrow_up() end, nil, function() _arrow_up() end)
dock_mode:bind({"alt"}, hs.keycodes.map["j"], function() _arrow_down() end, nil, function() _arrow_down() end)
dock_mode:bind({"alt"}, hs.keycodes.map["w"], function() _jump_start_word() end, nil, function() _jump_start_word() end)
dock_mode:bind({"alt"}, hs.keycodes.map["i"], function() _jump_start_word() end, nil, function() _jump_start_word() end)
dock_mode:bind({"alt"}, hs.keycodes.map["e"], function() _jump_end_word() end, nil, function() _jump_end_word() end)
dock_mode:bind({"alt"}, hs.keycodes.map["o"], function() _jump_end_word() end, nil, function() _jump_end_word() end)
dock_mode:bind({"alt", "shift"}, hs.keycodes.map["h"], function() _jump_to_start_of_line() end)
dock_mode:bind({"alt", "shift"}, hs.keycodes.map["l"], function() _jump_to_end_of_line() end)
dock_mode:bind({"alt"}, hs.keycodes.map["i"], function() _forward_delete() end, nil, function() _forward_delete() end)
dock_mode:bind({"alt", "shift"}, hs.keycodes.map["i"], function() _back_delete() end, nil, function() _back_delete() end)
dock_mode:bind({"alt"}, hs.keycodes.map["o"], function() _forward_select_word() _forward_delete() end)
dock_mode:bind({"alt", "shift"}, hs.keycodes.map["o"], function() _back_select_word() _forward_delete() end)
-- dock_mode:bind(nil, hs.keycodes.map["`"], function() _escape() end)
-- dock_mode:bind({"alt"}, hs.keycodes.map["`"], function() hs.eventtap.keyStrokes("`") end)
-- dock_mode:bind({"alt", "shift"}, hs.keycodes.map["`"], function() ap.keyStrokes("~") end)

dock_mode:enter()