require("data_struct")

cmd_mode = hs.hotkey.modal.new()

local keys_watcher = nil
local q = {a="1",b="2"}
local q_count = 0

function cmd_mode:entered()
    modal_box("CMD", color.red)
    -- keys_watcher:start()
end

function cmd_mode:exited()
    modal_box("DOCK", color.black)
end

-- local list = List:new()
-- hs.printf(list[first])

-- List.pushright(list, "1")
-- hs.printf(list[1])
-- disable_keys(cmd_mode

-- q["a"] = "A"
-- q["b"] = "B"
-- q["c"] = "C"
-- q["d"] = "D"

-- print_r(q)
for k, v in pairs( q ) do
    hs.printf(v)
end
-- keys_watcher = keys_watcher or hs.eventtap.new({ hs.eventtap.event.types.keyUp }, function(event)
--     local key_code = event:getKeyCode()
--     -- local time = hs.timer.secondsSinceEpoch()
--     -- hs.printf("[" .. key .. "] up")
--     if(key ~= "tab") then
--         keys_str = keys_str .. key
--         local len = string.len(keys_str)
--         if len >= 256 then
--             keys_str = string.sub(keys_str, -18)
--             -- hs.printf(keys_str)ssrf
--         end
--     else
--         if string.sub(keys_str, -3, -3) == "s" then
--             local cmd = string.sub(keys_str, -3) .. "x"
--             call_modal(cmd)
--         elseif string.sub(keys_str, -4, -4) == "s" and string.sub(keys_str, -3, -3) ~= "s" then
--             local cmd = string.sub(keys_str, -4)
--             call_modal(cmd)
--         end
--         table.insert(modal_list, vim_modal)
--     end
--     hs.printf(keys_str)
--     return false
-- end)



cmd_mode:bind(nil, hs.keycodes.map["escape"], function() cmd_mode:exit() end)
-- cmd_mode:bind(nil, hs.keycodes.map["tab"], function() cmd_exec() end)


hs.hotkey.bind({"alt"}, hs.keycodes.map["m"], function() cmd_mode:enter() end)
hs.hotkey.bind({"cmd"}, hs.keycodes.map["m"], function() cmd_mode:enter() end)