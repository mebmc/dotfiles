function activateApp(appName)
    local app = hs.application.find(appName)

    if app then
        -- App exists, bring it to front
        if app:mainWindow() then
            app:mainWindow():focus()
        else
            app:activate()
        end
    else
        -- App not running, launch it
        hs.application.launchOrFocus(appName)
    end
end

local LeftRightHotkey = require("spoons/LeftRightHotkey")

LeftRightHotkey.bind({ "rCmd" }, "f", function()
    activateApp("Firefox")
end)

LeftRightHotkey.bind({ "rCmd" }, "d", function()
    activateApp("WezTerm")
end)

LeftRightHotkey.bind({ "rCmd" }, "s", function()
    activateApp("Claude")
end)

LeftRightHotkey.bind({ "rCmd" }, "a", function()
    activateApp("Calendar")
end)

LeftRightHotkey.bind({ "rCmd" }, "c", function()
    activateApp("Microsoft Teams")
end)

LeftRightHotkey.bind({ "rCmd" }, "o", function()
    activateApp("Microsoft Outlook")
end)

LeftRightHotkey.bind({ "rCmd" }, "p", function()
    activateApp("Google Chrome")
end)

LeftRightHotkey.bind({ "rCmd" }, "z", function()
    activateApp("Discord")
end)

LeftRightHotkey.bind({ "rCmd" }, "g", function()
    activateApp("Spotify")
end)

LeftRightHotkey.bind({ "rCmd" }, "t", function()
    activateApp("Telegram")
end)

LeftRightHotkey.bind({ "rCmd" }, "b", function()
    activateApp("Zen Browser")
end)
