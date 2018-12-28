-- include moudles
if not module_list then
    module_list = {
        "config",
        "share",
        "dock_mode",
        "debug_mode"
    }
end

for i=1, #module_list do
    require(module_list[i])
end

hs.hotkey.bind({"cmd", "alt",}, "r", function()
    hs.reload()
end)
modal_message("Hammer Spoon")