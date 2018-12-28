dock_mode = hs.hotkey.modal.new()

-- init dock_mode
function dock_mode:entered()
    modal_box("DOCK", color.black)
end

function dock_mode:exited()

end

-- vim arrow key 
dock_mode:bind({"alt"}, hs.keycodes.map["h"], function() arrow_left() end, nil, function() arrow_left() end)
dock_mode:bind({"alt"}, hs.keycodes.map["l"], function() arrow_right() end, nil, function() arrow_right() end)
dock_mode:bind({"alt"}, hs.keycodes.map["k"], function() arrow_up() end, nil, function() arrow_up() end)
dock_mode:bind({"alt"}, hs.keycodes.map["j"], function() arrow_down() end, nil, function() arrow_down() end)

-- edit word
dock_mode:bind({"alt"}, hs.keycodes.map["o"], function() forward_select_word() forward_delete() end)
dock_mode:bind({"alt", "shift"}, hs.keycodes.map["o"], function() back_select_word() forward_delete() end)
dock_mode:bind({"alt"}, hs.keycodes.map["i"], function() forward_delete() end, nil, function() forward_delete() end)
dock_mode:bind({"alt", "shift"}, hs.keycodes.map["i"], function() back_delete() end, nil, function() back_delete() end)

-- arrow jump
dock_mode:bind({"alt", "shift"}, hs.keycodes.map["h"], function() jump_to_start_of_line() end)
dock_mode:bind({"alt", "shift"}, hs.keycodes.map["l"], function() jump_to_end_of_line() end)

-- tab
dock_mode:bind({"alt"}, hs.keycodes.map["e"], nil, function() next_tab()  end)
dock_mode:bind({"alt"}, hs.keycodes.map["w"], nil, function() previous_tab() end)

dock_mode:bind({"alt"}, hs.keycodes.map["m"], function() enter() end)

dock_mode:bind({"alt"}, hs.keycodes.map["f"], function() resize_win("fullscreen") end)

-- disable mininize and hide windows
dock_mode:bind({"cmd"}, hs.keycodes.map["m"], function() end)
dock_mode:bind({"cmd"}, hs.keycodes.map["h"], function() end)

-- auto switch language to EN when call alfred
dock_mode:bind({"alt"}, hs.keycodes.map["s"], function()
    hs.eventtap.keyStroke({"ctrl"}, "9", 0)
    switch_to_en()
end)

dock_mode:enter()




