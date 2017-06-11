dock_mode = hs.hotkey.modal.new()

function dock_mode:entered()
    set_modal_box('DOCK', color.black)
end


function dock_mode:exited()
    -- modal_stat('', color.red)
end

-- dock_mode:bind(nil, "escape", function() dock_mode:exit() end)
dock_mode:bind({"alt"}, "h", function() _arrow_left() end, nil, function() _arrow_left() end)
dock_mode:bind({"alt"}, "l", function() _arrow_right() end, nil, function() _arrow_right() end)
dock_mode:bind({"alt"}, "k", function() _arrow_up() end, nil, function() _arrow_up() end)
dock_mode:bind({"alt"}, "j", function() _arrow_down() end, nil, function() _arrow_down() end)
dock_mode:bind({"alt"}, "w", function() _jump_start_word() end, nil, function() _jump_start_word() end)
dock_mode:bind({"alt"}, "e", function() _jump_end_word() end, nil, function() _jump_end_word() end)
dock_mode:bind({"alt","shift"}, "h", function() _jump_to_start_of_line() end)
dock_mode:bind({"alt","shift"}, "l", function() _jump_to_end_of_line() end)
dock_mode:bind({"alt"}, ",", function() _forward_delete() end, nil, function() _forward_delete() end)
dock_mode:bind({"alt", "shift"}, ",", function() _back_delete() end, nil, function() _back_delete() end)
dock_mode:bind({"alt"}, ".", function() _forward_select_word() end, nil, function() _back_select_word() end)
dock_mode:bind({"alt","shift"}, ".", function() _forward_select_word() end, nil, function() _back_select_word() end)

dock_mode:enter()