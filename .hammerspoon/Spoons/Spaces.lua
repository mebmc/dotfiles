-- Function to move an application window to a specific space
local function moveAppToSpace(appName, spaceNumber)
    local app = hs.application.find(appName)
    if app then
        local win = app:mainWindow()
        if win then
            -- Get all spaces
            local spaces = hs.spaces.allSpaces()
            -- Find the target space ID for the desired space number
            local targetSpaceID = nil
            for screenID, spaceIDs in pairs(spaces) do
                if spaceNumber <= #spaceIDs then
                    targetSpaceID = spaceIDs[spaceNumber]
                    break
                end
            end

            if targetSpaceID then
                -- Move the window to the target space
                hs.spaces.moveWindowToSpace(win, targetSpaceID)
                -- Focus the window on the new space
                win:focus()
            end
        end
    end
end

-- Function to watch for Teams and Outlook windows and move them
local function handleAppWindow(appName, event, app)
    if event == hs.application.watcher.launched then
        if appName == "Microsoft Teams" then
            -- Wait a bit for the window to fully load
            hs.timer.doAfter(2, function()
                moveAppToSpace("Microsoft Teams", 3)
            end)
        elseif appName == "Microsoft Outlook" then
            -- Wait a bit for the window to fully load
            hs.timer.doAfter(2, function()
                moveAppToSpace("Microsoft Outlook", 4)
            end)
        elseif appName == "Spotify" then
            -- Wait a bit for the window to fully load
            hs.timer.doAfter(2, function()
                moveAppToSpace("Spotify", 5)
            end)
        elseif appName == "Discord" then
            -- Wait a bit for the window to fully load
            hs.timer.doAfter(8, function()
                moveAppToSpace("Discord", 7)
            end)
        elseif appName == "Telegram" then
            -- Wait a bit for the window to fully load
            hs.timer.doAfter(2, function()
                moveAppToSpace("Telegram", 7)
            end)
        elseif appName == "Zen Browser" then
            -- Wait a bit for the window to fully load
            hs.timer.doAfter(2, function()
                moveAppToSpace("Zen Browser", 9)
            end)
        elseif appName == "Brave" then
            -- Wait a bit for the window to fully load
            hs.timer.doAfter(2, function()
                moveAppToSpace("Brave", 9)
            end)
        end
    end
end

-- Create and start the application watcher
local appWatcher = hs.application.watcher.new(handleAppWindow)
appWatcher:start()

-- Initial placement for already-running applications
-- hs.timer.doAfter(1, function()
--     moveAppToSpace("Microsoft Teams", 3)
--     moveAppToSpace("Microsoft Outlook", 4)
--     moveAppToSpace("Spotify", 5)
--     moveAppToSpace("Discord", 7)
--     moveAppToSpace("Telegram", 7)
--     moveAppToSpace("Zen Browser", 9)
--     moveAppToSpace("Brave", 9)
-- end)
--
-- hs.timer.doAfter(5, function()
--     hs.spaces.gotoSpace(1)
-- end)
