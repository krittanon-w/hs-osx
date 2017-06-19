require("data_struct")

cmd_mode = hs.hotkey.modal.new()

local keys_watcher = nil
local KEY = {
    tab = hs.keycodes.map["tab"],
    s = hs.keycodes.map["s"],
    x = hs.keycodes.map["x"]
}

cmd_table = {}
-- cmd_table[1] = 0
-- cmd_table[2] = 0
-- cmd_table[3] = 0
-- cmd_table[4] = 0

function cmd_mode:entered()
    modal_box("CMD", color.red)
    keys_watcher:start()
end

function cmd_mode:exited()
    modal_box("DOCK", color.black)
end

disable_keys(cmd_mode)

local function pop_last()
    table.remove(cmd_table, #cmd_table)
end

local function push(key_code)
    table.insert(cmd_table, 1, key_code)
end

local function exec_sqmode()

end

keys_watcher = keys_watcher or hs.eventtap.new({ hs.eventtap.event.types.keyUp },
    function(event)
        local key_code = event:getKeyCode()
        hs.printf("[" .. hs.keycodes.map[key_code] .. ", " .. key_code .. "] up")
        -- 4 3 2 1
        if(key_code == KEY.tab) then
            if cmd_table[4] ~= KEY.s then
                push(KEY.x)
                pop_last()
            end
            exec_sqmode()
            print_table(cmd_table)
        else
            push(key_code)
            if #cmd_table == 5 then
                pop_last()
            end
        end
    end
)



cmd_mode:bind(nil, hs.keycodes.map["escape"], function() cmd_mode:exit() end)
-- cmd_mode:bind(nil, hs.keycodes.map["tab"], function() cmd_exec() end)


hs.hotkey.bind({"alt"}, hs.keycodes.map["m"], function() cmd_mode:enter() end)
hs.hotkey.bind({"cmd"}, hs.keycodes.map["m"], function() cmd_mode:enter() end)