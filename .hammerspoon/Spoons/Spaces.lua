-- Function to move an application window to a specific space

local log = hs.logger.new('Spaces', 'debug')
log.i("Spaces start")

local app = hs.application.find("Claude")
local win = app:mainWindow()
local result = hs.spaces.moveWindowToSpace(win, 1, true)
hs.alert.show("Moved " .. app:name() .. " to space " .. 1)

local appTargets = {
    ["Claude"] = 1,
    ["Code"] = 2,
    ["WezTerm"] = 3,
    ["Firefox"] = 4,
    ["Microsoft Teams"] = 5,
    ["Microsoft Outlook"] = 6,
    ["Unity Hub"] = 7,
    ["Spotify"] = 8,
    ["Zen Browser"] = 9,
    ["Discord"] = 10,
    ["Telegram"] = 10,
    ["Brave"] = 11
}

-- local function moveAppToSpace(appName, spaceNumber)
--     local app = hs.application.find(appName)
--     -- log.i(app)
--     if app then
--         local win = app:mainWindow()
--         if win then
--             -- Get all spaces
--             local spaces = hs.spaces.allSpaces()
--             -- Get the primary screen's ID (first screen)
--             local primaryScreen = hs.screen.primaryScreen():getUUID()
--             local targetSpaceID = nil

--             -- Use primary screen's spaces
--             if spaces[primaryScreen] and spaceNumber <= #spaces[primaryScreen] then
--                 targetSpaceID = spaces[primaryScreen][spaceNumber]
--             end

--             if targetSpaceID then
--                 -- Move the window to the target space
--                 -- hs.alert.show("Moving " .. appName .. " to space " .. spaceNumber)
--                 log.i("Moving " .. appName .. " to space " .. spaceNumber)
--                 out = hs.spaces.moveWindowToSpace(win, targetSpaceID, true)
--                 if out ~= true then
--                     log.i("Failed" .. out)
--                 end
--                 -- win:focus()
--             else
--                 hs.alert.show("Unable to find target space " .. spaceNumber)
--             end
--         else
--             hs.alert.show("No window found for " .. appName)
--         end
--     else
--         hs.alert.show("Application not found: " .. appName)
--     end
-- end

-- -- Function to watch for application windows and move them
-- local function handleAppWindow(appName, event, app)
--     if event == hs.application.watcher.launched then
--         hs.alert.show(appName)

--         local targetSpace = appTargets[appName]
--         if targetSpace then
--             -- Special case for Discord which needs more time to load
--             -- local waitTime = appName == "Discord" and 8 or 2
--             local waitTime = 2

--             -- Wait for the window to fully load
--             hs.timer.doAfter(waitTime, function()
--                 moveAppToSpace(appName, targetSpace)
--             end)
--         end
--     end
-- end

-- -- Create and start the application watcher
-- local appWatcher = hs.application.watcher.new(handleAppWindow)
-- appWatcher:start()

-- -- Initial placement for already-running applications
-- hs.timer.doAfter(1, function()
--     for appName, spaceNumber in pairs(appTargets) do
--         moveAppToSpace(appName, spaceNumber)
--     end
-- end)

-- -- hs.timer.doAfter(5, function()
-- --     hs.spaces.gotoSpace(1)
-- -- end)
