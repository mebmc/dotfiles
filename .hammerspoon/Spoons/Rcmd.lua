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

local shortcuts = {
    { key = "a", app = "Claude" },
    { key = "s", app = "Code" },
    { key = "d", app = "Firefox" },
    { key = "f", app = "Ghostty" },
    { key = "g", app = "Microsoft Teams" },
    { key = "h", app = "Microsoft Outlook" },
    { key = "j", app = "Unity Hub" },
    { key = "k", app = "Zen Browser" },
    { key = "l", app = "Spotify" },
    { key = ";", app = "Telegram" },
    { key = "x", app = "Calendar" },
    { key = "p", app = "Google Chrome" },
    { key = "z", app = "Discord" },
}

for _, shortcut in ipairs(shortcuts) do
    LeftRightHotkey.bind({ "rCmd" }, shortcut.key, function()
        activateApp(shortcut.app)
    end)
end
