-- include files
require("config")
require("share")
require("setup")

hs.loadSpoon("ModalMan")

if not hspoon_list then
    hspoon_list = {
        "Dock",
        "Vim",
        "WinWin",
    }
end

-- Load those Spoons
for k, v in pairs(hspoon_list) do
    hs.loadSpoon(v)
end

-- map keys
if spoon.WinWin then
    spoon.ModalMan:new("resizeM")
    local cmodal = spoon.ModalMan.modal_list["resizeM"]
    cmodal:bind("", "escape", "Deactivate resizeM", function() spoon.ModalMan:deactivate({"resizeM"}) end)
    cmodal:bind("", "Q", "Deactivate resizeM", function() spoon.ModalMan:deactivate({"resizeM"}) end)
    cmodal:bind("", "tab", "Toggle Cheatsheet", function() spoon.ModalMan:toggleCheatsheet() end)
    -- cmodal:bind("", "A", "Move Leftward", function() spoon.WinWin:stepMove("left") end, nil, function() spoon.WinWin:stepMove("left") end)
    -- cmodal:bind("", "D", "Move Rightward", function() spoon.WinWin:stepMove("right") end, nil, function() spoon.WinWin:stepMove("right") end)
    -- cmodal:bind("", "W", "Move Upward", function() spoon.WinWin:stepMove("up") end, nil, function() spoon.WinWin:stepMove("up") end)
    -- cmodal:bind("", "S", "Move Downward", function() spoon.WinWin:stepMove("down") end, nil, function() spoon.WinWin:stepMove("down") end)
    cmodal:bind("", "H", "Lefthalf of Screen", function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("halfleft") end)
    cmodal:bind("", "L", "Righthalf of Screen", function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("halfright") end)
    cmodal:bind("", "K", "Uphalf of Screen", function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("halfup") end)
    cmodal:bind("", "J", "Downhalf of Screen", function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("halfdown") end)
    cmodal:bind("", "Y", "NorthWest Corner", function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("cornerNW") end)
    cmodal:bind("", "O", "NorthEast Corner", function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("cornerNE") end)
    cmodal:bind("", "U", "SouthWest Corner", function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("cornerSW") end)
    cmodal:bind("", "I", "SouthEast Corner", function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("cornerSE") end)
    cmodal:bind("", "F", "Fullscreen", function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("fullscreen") end)
    cmodal:bind("", "C", "Center Window", function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("center") end)
    cmodal:bind("", "=", "Stretch Outward", function() spoon.WinWin:moveAndResize("expand") end, nil, function() spoon.WinWin:moveAndResize("expand") end)
    cmodal:bind("", "-", "Shrink Inward", function() spoon.WinWin:moveAndResize("shrink") end, nil, function() spoon.WinWin:moveAndResize("shrink") end)
    -- cmodal:bind("shift", "H", "Move Leftward", function() spoon.WinWin:stepResize("left") end, nil, function() spoon.WinWin:stepResize("left") end)
    -- cmodal:bind("shift", "L", "Move Rightward", function() spoon.WinWin:stepResize("right") end, nil, function() spoon.WinWin:stepResize("right") end)
    -- cmodal:bind("shift", "K", "Move Upward", function() spoon.WinWin:stepResize("up") end, nil, function() spoon.WinWin:stepResize("up") end)
    -- cmodal:bind("shift", "J", "Move Downward", function() spoon.WinWin:stepResize("down") end, nil, function() spoon.WinWin:stepResize("down") end)
    cmodal:bind("", "left", "Move to Left Monitor", function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("left") end)
    cmodal:bind("", "right", "Move to Right Monitor", function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("right") end)
    cmodal:bind("", "up", "Move to Above Monitor", function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("up") end)
    cmodal:bind("", "down", "Move to Below Monitor", function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("down") end)
    cmodal:bind("", "space", "Move to Next Monitor", function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("next") end)
    cmodal:bind("", "[", "Undo Window Manipulation", function() spoon.WinWin:undo() end)
    cmodal:bind("", "]", "Redo Window Manipulation", function() spoon.WinWin:redo() end)
    -- cmodal:bind("", "`", "Center Cursor", function() spoon.WinWin:centerCursor() end)

    -- Register resizeM with modal supervisor
    hsresizeM_keys = hsresizeM_keys or {"alt", "R"}
    if string.len(hsresizeM_keys[2]) > 0 then
        spoon.ModalMan.supervisor:bind(hsresizeM_keys[1], hsresizeM_keys[2], "Enter resizeM Environment", function()
            -- Deactivate some modal environments or not before activating a new one
            spoon.ModalMan:deactivateAll()
            -- Show an status indicator so we know we"re in some modal environment now
            spoon.ModalMan:activate({"resizeM"}, "#B22222")
        end)
    end
end



if spoon.Vim then
    spoon.ModalMan:new("VimMode")
    local cmodal = spoon.ModalMan.modal_list["VimMode"]
    local modsA = {"alt"}
    local modsB = {"alt", "shift"}
    -- cmodal:bind("", "escape", "Deactivate VimMode", function() spoon.ModalMan:deactivate({"VimMode"}) end)
    -- cmodal:bind("", "Q", "Deactivate VimMode", function() spoon.ModalMan:deactivate({"VimMode"}) end)
    -- cmodal:bind("", "tab", "Toggle Cheatsheet", function() spoon.ModalMan:toggleCheatsheet() end)

    cmodal:bind(modsA, getKeyCode("H"), function() spoon.Vim:move("left") end, nil, function() spoon.Vim:move("left") end)
    cmodal:bind(modsA, getKeyCode("L"), function() spoon.Vim:move("right") end, nil, function() spoon.Vim:move("right") end)
    cmodal:bind(modsA, getKeyCode("J"), function() spoon.Vim:move("down") end, nil, function() spoon.Vim:move("down") end)
    cmodal:bind(modsA, getKeyCode("K"), function() spoon.Vim:move("up") end, nil, function() spoon.Vim:move("up") end)
    
    cmodal:bind(modsA, getKeyCode("I"), function() spoon.Vim:delete("left") end, nil, function() spoon.Vim:delete("left") end)
    cmodal:bind(modsA, getKeyCode("O"), function() spoon.Vim:delete("right") end, nil, function() spoon.Vim:delete("right") end)
    
    cmodal:bind(modsB, getKeyCode("I"), function() spoon.Vim:delete("left_word") end, nil, function() spoon.Vim:delete("left_word") end)
    cmodal:bind(modsB, getKeyCode("O"), function() spoon.Vim:delete("right_word") end, nil, function() spoon.Vim:delete("right_word") end)

    cmodal:bind(modsA, getKeyCode("Y"), function() spoon.Vim:jump("start") end, nil, function() spoon.Vim:jump("start") end)
    cmodal:bind(modsA, getKeyCode("U"), function() spoon.Vim:jump("end") end, nil, function() spoon.Vim:jump("end") end)
    
    cmodal:bind(modsB, getKeyCode("H"), function() spoon.Vim:jump("left_word") end, nil, function() spoon.Vim:jump("left_word") end)
    cmodal:bind(modsB, getKeyCode("L"), function() spoon.Vim:jump("right_word") end, nil, function() spoon.Vim:jump("right_word") end)

    -- Register resizeM with modal supervisor
    -- hsVimMode_keys = hsVimMode_keys or {"alt", "V"}
    -- if string.len(hsVimMode_keys[2]) > 0 then
    --     spoon.ModalMan.supervisor:bind(hsVimMode_keys[1], hsVimMode_keys[2], "Enter VimMode Environment", function()
    --         -- Deactivate some modal environments or not before activating a new one
    --         spoon.ModalMan:deactivateAll()
    --         -- Show an status indicator so we know we"re in some modal environment now
    --         spoon.ModalMan:activate({"VimMode"}, "#019833")
    --     end)
    -- end
    spoon.ModalMan:activate({"VimMode"}, "#019833")
end

hs.alert("- HammerSpoon -")