require("cmd_list")

cmd_mode = hs.hotkey.modal.new()

disable_keys(cmd_mode) -- defind disable keys

local keys_watcher = nil

local key_queue = {}

function cmd_mode:entered()
    modal_box("CMD", color.red)
    keys_watcher:start()
end

function cmd_mode:exited()
    modal_box("DOCK", color.black)
end

keys_watcher = keys_watcher or hs.eventtap.new({ hs.eventtap.event.types.keyUp },
    function(event)
        local function add(key)
            table.insert(key_queue, 1, key) -- add to index 1 -> (1) 2 3 4
        end

        local function remove()
            table.remove(key_queue, #key_queue)
        end

        local key = event:getCharacters()
        local key_code = event:getKeyCode()
        hs.printf("key character = " .. key)
        if(key_code == hs.keycodes.map["tab"]) then
            _switch_to_EN()
            -- print_table(key_queue)
            local cmd = ""
            for k, v in pairs(key_queue) do
                -- table.insert(cmd, 1, hs.keycodes.map[v])
                cmd = hs.keycodes.map[v] .. cmd
            end
            hs.printf   (cmd)
            get_cmd(cmd)
        else
            add(key_code)
            if #key_queue >= 5 then
                remove()
            end
        end
    end
)

cmd_mode:bind(nil, hs.keycodes.map["escape"], function() cmd_mode:exit() end)
hs.hotkey.bind({"alt"}, hs.keycodes.map["c"], function() cmd_mode:enter() end)