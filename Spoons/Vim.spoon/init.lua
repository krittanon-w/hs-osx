--- === Vim ===
---
--- Vim in Emacs :)
---

local obj={}
obj.__index = obj

-- Metadata
obj.name = "Vim"
obj.version = "1.0"
obj.author = "Krittanon Wisedchart <krittanon.w@gmail.com>"
obj.homepage = "https://github.com/Hammerspoon/Spoons"
obj.license = "MIT - https://opensource.org/licenses/MIT"

-- Main Functions
-- move
function obj:move(option)
    if option == "left" then
        hs.eventtap.keyStroke(nil, "left", 0)
    elseif option == "right" then
        hs.eventtap.keyStroke(nil, "right", 0)
    elseif option == "up" then
        hs.eventtap.keyStroke(nil, "up", 0)
    elseif option == "down" then
        hs.eventtap.keyStroke(nil, "down", 0)
    end
end

-- delete
function obj:delete(option)
    if option == "left" then
        hs.eventtap.keyStroke(nil, "delete", 0)
    elseif option == "right" then
        hs.eventtap.keyStroke(nil, "forwarddelete", 0)
    elseif option == "left_word" then
        hs.eventtap.keyStroke({"alt","shift"}, "left", 0)
        hs.eventtap.keyStroke(nil, "delete", 0)
    elseif option == "right_word" then
        hs.eventtap.keyStroke({"alt","shift"}, "right", 0)
        hs.eventtap.keyStroke(nil, "delete", 0)
    end
end

-- jump
function obj:jump(option)
    if option == "left_word" then
        hs.eventtap.keyStroke({"alt"}, "left", 0)
    elseif option == "right_word" then
        hs.eventtap.keyStroke({"alt"}, "right", 0)
    elseif option == "start" then
        hs.eventtap.keyStroke({"cmd"}, "left", 0)
    elseif option == "end" then
        hs.eventtap.keyStroke({"cmd"}, "right", 0)
    end
end

return obj