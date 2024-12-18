-- Time window in seconds for the 'jk' sequence
local timeWindow = 0.2
local lastKeyTime = 0
local lastKeyCode = nil

-- Create a new keyboard event tap
local function keyStrokeHandler(event)
    local currentKeyCode = event:getKeyCode()
    local currentTime = hs.timer.secondsSinceEpoch()
    local eventType = event:getType()

    -- Only handle key down events
    if eventType == hs.eventtap.event.types.keyDown then
        -- 'j' key code is 38, 'k' key code is 40
        if currentKeyCode == 38 then -- 'j' pressed
            lastKeyCode = currentKeyCode
            lastKeyTime = currentTime
            return false
        elseif currentKeyCode == 40 and                       -- 'k' pressed
            lastKeyCode == 38 and                             -- previous key was 'j'
            (currentTime - lastKeyTime) <= timeWindow then    -- within time window
            -- Delete the 'j' character
            hs.eventtap.keyStroke({}, "delete")
            -- Send escape key
            hs.eventtap.keyStroke({}, "escape")

            lastKeyCode = nil
            return true
        end

        lastKeyCode = currentKeyCode
        lastKeyTime = currentTime
    end

    return false
end

-- Create and start the event tap
local tap = hs.eventtap.new(
    { hs.eventtap.event.types.keyDown },
    keyStrokeHandler
)
tap:start()
