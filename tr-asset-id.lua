


hs.hotkey.bind({"cmd"}, "8", function()
    hs.eventtap.keyStrokes("tr:application-asset-insight-id")
    hs.eventtap.keyStroke(nil, "tab", 0)
    hs.eventtap.keyStrokes("203973")
    hs.eventtap.keyStroke(nil, "tab", 0)

    hs.eventtap.keyStrokes("tr:environment-type")
    hs.eventtap.keyStroke(nil, "tab", 0)
    hs.eventtap.keyStrokes("PRE-PRODUCTION")
    hs.eventtap.keyStroke(nil, "tab", 0)

    hs.eventtap.keyStrokes("tr:financial-identifier")
    hs.eventtap.keyStroke(nil, "tab", 0)
    hs.eventtap.keyStrokes("283711002")
    hs.eventtap.keyStroke(nil, "tab", 0)

    hs.eventtap.keyStrokes("tr:resource-owner")
    hs.eventtap.keyStroke(nil, "tab", 0)
    hs.eventtap.keyStrokes("bams-dev@thomsonreuters.com")
end)


