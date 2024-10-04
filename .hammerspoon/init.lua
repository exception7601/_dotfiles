
hs.hotkey.bind({"cmd", "shift"}, "m", function()
   -- Pega o Discord
   local myApp = hs.application.applicationsForBundleID('com.hnc.Discord')[1]
   
   hs.eventtap.keyStroke({"cmd", "shift"}, "m", 20, myApp)
end)

-- Bind Command + Enter to open Alacritty using a closure
hs.hotkey.bind({"cmd"}, "return", function()
	hs.application.launchOrFocus("Alacritty")
  -- hs.execute("open -na Alacritty")
end)

-- Atalho para próxima música (Cmd + Shift + >)
hs.hotkey.bind({"cmd", "shift"}, "right", function()
  local myApp = hs.application.applicationsForBundleID('com.apple.Music')[1]
  -- hs.shortcuts.run('Next Music')
  hs.eventtap.keyStroke({"cmd"}, "right", 20, myApp)
end)

-- Function to move window to next display
local function moveToNextDisplay()
    local win = hs.window.focusedWindow()
    if not win then return end

    win:moveToScreen(win:screen():next(), true, true)
end

-- Function to move window to previous display
local function moveToPreviousDisplay()
    local win = hs.window.focusedWindow()
    if not win then return end

    win:moveToScreen(win:screen():previous(), true, true)
end

-- Store the original window sizes to toggle between maximize and restore
local windowStates = {}

-- Function to toggle maximize/restore
local function toggleMaximize()
    local win = hs.window.focusedWindow()
    if not win then return end

    local winId = win:id()
    if not winId then return end

    -- Check if window is already maximized or not
    if windowStates[winId] then
        -- If window is maximized, restore the original size
        win:setFrame(windowStates[winId])
        windowStates[winId] = nil  -- Clear the stored size
    else
        -- If window is not maximized, store the current size and maximize
        windowStates[winId] = win:frame()
        win:maximize()
    end
end

-- Reload config with Cmd + Alt + Ctrl + R
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "r", function()
    hs.reload()
end)

-- hs.hotkey.bind({"cmd", "alt"}, "return", toggleMaximize)          -- Maximize/Restore
-- Additional window commands
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "right", moveToNextDisplay)            -- Next Display
---hs.hotkey.bind({"cmd", "alt", "ctrl"}, "left", moveToPreviousDisplay)        -- Previous Display

hs.window.animationDuration = 0

-- hs.hotkey.bind({}, "f1", "f1 hotkey", function() hs.eventtap.keyStroke({"cmd"}, "c") end)
-- hs.hotkey.bind({}, "f2", "f2 hotkey", function() hs.eventtap.keyStroke({"cmd"}, "v") end)

local hyper = {'cmd', 'alt'}

function disconnectBluetooth()
    hs.alert('Disconnecting Sonys')
    hs.shortcuts.run("disconnect phone")
end

function connectBluetooth()
    hs.alert('Connecting Sonys')
    hs.shortcuts.run("connect phone")
end

function caffeinateCallback(eventType)
  if (eventType == hs.caffeinate.watcher.screensDidSleep) then
    disconnectBluetooth()
  elseif (eventType == hs.caffeinate.watcher.screensDidWake) then
    connectBluetooth()
  end
end

hs.hotkey.bind({"cmd", "shift"}, '8', function()
  connectBluetooth()
end)

hs.hotkey.bind({"cmd", "shift"}, '9', function()
  disconnectBluetooth()
end)

-- caffeinateWatcher = hs.caffeinate.watcher.new(caffeinateCallback)
-- caffeinateWatcher:start()

-- Grid
hs.grid.setMargins(hs.geometry.size(0,0))
hs.grid.setGrid('2x2')

hs.hotkey.bind({"cmd", "alt"},'g',function()
  hs.grid.show()
end)

local bind = {"cmd", "alt"}
function setWindowGrid(key, gridSettings)
  hs.hotkey.bind(bind, key, function()
    local win = hs.window.focusedWindow()
    hs.grid.set(win, gridSettings)
  end)
end

setWindowGrid("left",   "0,0 1x2")
setWindowGrid("right",  "1,0 1x2")
setWindowGrid("up",     "0,0 2x1")
setWindowGrid("down",   "0,1 2x1")
setWindowGrid("return", "0,0 2x2")


