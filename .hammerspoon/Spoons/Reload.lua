local LeftRightHotkey = require("spoons/LeftRightHotkey")

-- Define Right Command + R as the reload hotkey
LeftRightHotkey.bind({ "rCmd" }, "r", function()
    hs.reload()
    -- Optional: Show a notification when config is reloaded
    hs.alert.show("Config reloaded")
    hs.notify.new({ title = "Hammerspoon", informativeText = "Config reloaded", withdrawAfter = 5 }):send()
end)

-- LeftRightHotkey.bind({ "rCmd" }, "t", function()
--     hs.notify.new({ title = "Hammerspoon", informativeText = "Bob", withdrawAfter = 5 }):send()
-- end)
