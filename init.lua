-- include files
require("config")
require("share")
require("setup")

hs.loadSpoon("ModalMan")
-- automatic load ModalManager

if not hspoon_list then
    hspoon_list = {
        "Vim",
        "Resize",
    }
end

-- Load those Spoons
for k, v in pairs(hspoon_list) do
    hs.loadSpoon(v)
end

    -- map keys 
if spoon.Resize then
    spoon.ModalMan:new("ResizeMode", "#d50206")
    local cmodal = spoon.ModalMan.modal_list["ResizeMode"]
    cmodal:bind(nil, "escape", "Deactivate ResizeMode", function() spoon.ModalMan:deactivate({"ResizeMode"}) end)
    cmodal:bind(nil, "Q", "Deactivate ResizeMode", function() spoon.ModalMan:deactivate({"ResizeMode"}) end)
    cmodal:bind(nil, "tab", "Toggle Cheatsheet", function() spoon.ModalMan:toggleCheatsheet() end)

    cmodal:bind(nil, getKeyCode("H"), "Lefthalf of Screen", function() spoon.Resize:stash() spoon.Resize:moveAndResize("halfleft") end)
    cmodal:bind(nil, getKeyCode("L"), "Righthalf of Screen", function() spoon.Resize:stash() spoon.Resize:moveAndResize("halfright") end)
    cmodal:bind(nil, getKeyCode("K"), "Uphalf of Screen", function() spoon.Resize:stash() spoon.Resize:moveAndResize("halfup") end)
    cmodal:bind(nil, getKeyCode("J"), "Downhalf of Screen", function() spoon.Resize:stash() spoon.Resize:moveAndResize("halfdown") end)
    cmodal:bind(nil, getKeyCode("Y"), "NorthWest Corner", function() spoon.Resize:stash() spoon.Resize:moveAndResize("cornerNW") end)
    cmodal:bind(nil, getKeyCode("O"), "NorthEast Corner", function() spoon.Resize:stash() spoon.Resize:moveAndResize("cornerNE") end)
    cmodal:bind(nil, getKeyCode("U"), "SouthWest Corner", function() spoon.Resize:stash() spoon.Resize:moveAndResize("cornerSW") end)
    cmodal:bind(nil, getKeyCode("I"), "SouthEast Corner", function() spoon.Resize:stash() spoon.Resize:moveAndResize("cornerSE") end)
    cmodal:bind(nil, getKeyCode("F"), "Fullscreen", function() spoon.Resize:stash() spoon.Resize:moveAndResize("fullscreen") end)
    cmodal:bind(nil, getKeyCode("C"), "Center Resizedow", function() spoon.Resize:stash() spoon.Resize:moveAndResize("center") end)
    cmodal:bind(nil, getKeyCode("="), "Stretch Outward", function() spoon.Resize:moveAndResize("expand") end, nil, function() spoon.Resize:moveAndResize("expand") end)
    cmodal:bind(nil, getKeyCode("-"), "Shrink Inward", function() spoon.Resize:moveAndResize("shrink") end, nil, function() spoon.Resize:moveAndResize("shrink") end)

    cmodal:bind(nil, getKeyCode("A"), "Move to Left Monitor", function() spoon.Resize:stash() spoon.Resize:moveToScreen("left") end)
    cmodal:bind(nil, getKeyCode("D"), "Move to Right Monitor", function() spoon.Resize:stash() spoon.Resize:moveToScreen("right") end)
    cmodal:bind(nil, getKeyCode("W"), "Move to Above Monitor", function() spoon.Resize:stash() spoon.Resize:moveToScreen("up") end)
    cmodal:bind(nil, getKeyCode("S"), "Move to Below Monitor", function() spoon.Resize:stash() spoon.Resize:moveToScreen("down") end)
    cmodal:bind(nil, "space", "Move to Next Monitor", function() spoon.Resize:stash() spoon.Resize:moveToScreen("next") end)
    cmodal:bind(nil, getKeyCode("["), "Undo Resizedow Manipulation", function() spoon.Resize:undo() end)
    cmodal:bind(nil, getKeyCode("]"), "Redo Resizedow Manipulation", function() spoon.Resize:redo() end)

    hsResizeMode_keys = hsResizeMode_keys or {"alt", "R"}
    if string.len(hsResizeMode_keys[2]) > 0 then
        spoon.ModalMan.supervisor:bind(hsResizeMode_keys[1], getKeyCode(hsResizeMode_keys[2]), "Enter ResizeMode Environment", function()
            spoon.ModalMan:deactivateAll()
            spoon.ModalMan:activate({"ResizeMode"})
        end)
    end
end



if spoon.Vim then
    spoon.ModalMan:new("VimMode", "#000000")
    local cmodal = spoon.ModalMan.modal_list["VimMode"]
    -- cmodal:bind("", "escape", "Deactivate VimMode", function() spoon.ModalMan:deactivate({"VimMode"}) end)
    -- cmodal:bind("", "Q", "Deactivate VimMode", function() spoon.ModalMan:deactivate({"VimMode"}) end)
    -- cmodal:bind("", "tab", "Toggle Cheatsheet", function() spoon.ModalMan:toggleCheatsheet() end)

    cmodal:bind({"alt"}, getKeyCode("H"), function() spoon.Vim:move("left") end, nil, function() spoon.Vim:move("left") end)
    cmodal:bind({"alt"}, getKeyCode("L"), function() spoon.Vim:move("right") end, nil, function() spoon.Vim:move("right") end)
    cmodal:bind({"alt"}, getKeyCode("J"), function() spoon.Vim:move("down") end, nil, function() spoon.Vim:move("down") end)
    cmodal:bind({"alt"}, getKeyCode("K"), function() spoon.Vim:move("up") end, nil, function() spoon.Vim:move("up") end)
    
    cmodal:bind({"alt"}, getKeyCode("I"), function() spoon.Vim:delete("left") end, nil, function() spoon.Vim:delete("left") end)
    cmodal:bind({"alt"}, getKeyCode("O"), function() spoon.Vim:delete("right") end, nil, function() spoon.Vim:delete("right") end)
    
    cmodal:bind({"alt", "shift"}, getKeyCode("I"), function() spoon.Vim:delete("left_word") end, nil, function() spoon.Vim:delete("left_word") end)
    cmodal:bind({"alt", "shift"}, getKeyCode("O"), function() spoon.Vim:delete("right_word") end, nil, function() spoon.Vim:delete("right_word") end)

    cmodal:bind({"alt"}, getKeyCode("Y"), function() spoon.Vim:jump("start") end, nil, function() spoon.Vim:jump("start") end)
    cmodal:bind({"alt"}, getKeyCode("U"), function() spoon.Vim:jump("end") end, nil, function() spoon.Vim:jump("end") end)
    
    cmodal:bind({"alt", "shift"}, getKeyCode("H"), function() spoon.Vim:jump("left_word") end, nil, function() spoon.Vim:jump("left_word") end)
    cmodal:bind({"alt", "shift"}, getKeyCode("L"), function() spoon.Vim:jump("right_word") end, nil, function() spoon.Vim:jump("right_word") end)

    hsVimMode_keys = hsVimMode_keys or {"alt", "V"}
    if string.len(hsVimMode_keys[2]) > 0 then
        spoon.ModalMan.supervisor:bind(hsVimMode_keys[1], getKeyCode(hsVimMode_keys[2]), "Enter VimMode Environment", function()
            spoon.ModalMan:deactivateAll()
            spoon.ModalMan:activate({"VimMode"})
        end)
    end

    -- auto trigger when hs loaded
    spoon.ModalMan:activate({"VimMode"})
end

spoon.ModalMan:getInstance():enter()
hs.alert("- HammerSpoon -")
-- hs.hints.windowHints()

