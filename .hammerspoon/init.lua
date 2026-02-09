hs.hotkey.bind({"cmd", "shift"}, "m", function()
  local discord = hs.application.applicationsForBundleID('com.hnc.Discord')[1]
  discord:activate()

  hs.timer.doAfter(0.2, function()
    hs.eventtap.keyStroke({"cmd", "shift"}, "m", 0, discord)
  end)
end)

-- Bind Command + Enter to open Alacritty using a closure
hs.hotkey.bind({"cmd"}, "return", function()
  hs.application.launchOrFocus("iTerm")
  -- hs.execute("open -na Alacritty")
end)

-- Atalho para próxima música (Cmd + Shift + >)
hs.hotkey.bind({"cmd", "shift"}, "right", function()
  local music = hs.application.applicationsForBundleID('com.apple.Music')[1]
  -- music:activate()
  hs.eventtap.keyStroke({"cmd"}, "right", 2000, music)
end)

-- Function to move window to next display
-- local function moveToNextDisplay()
    -- local win = hs.window.focusedWindow()
    -- if not win then return end

    -- win:moveToScreen(win:screen():next(), true, true)
-- end

-- Function to move window to previous display
-- local function moveToPreviousDisplay()
--     local win = hs.window.focusedWindow()
--     if not win then return end

--     win:moveToScreen(win:screen():previous(), true, true)
-- end

-- Store the original window sizes to toggle between maximize and restore
-- local windowStates = {}

-- Function to toggle maximize/restore
-- local function toggleMaximize()
--     local win = hs.window.focusedWindow()
--     if not win then return end

--     local winId = win:id()
--     if not winId then return end

--     -- Check if window is already maximized or not
--     if windowStates[winId] then
--         -- If window is maximized, restore the original size
--         win:setFrame(windowStates[winId])
--         windowStates[winId] = nil  -- Clear the stored size
--     else
--         -- If window is not maximized, store the current size and maximize
--         windowStates[winId] = win:frame()
--         win:maximize()
--     end
-- end

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

-- local hyper = {'cmd', 'alt'}

-- function DisconnectBluetooth()
--     hs.alert('Disconnecting Sonys')
--     hs.shortcuts.run("disconnect phone")
-- end

-- caffeinateWatcher = hs.caffeinate.watcher.new(caffeinateCallback)
-- caffeinateWatcher:start()

-- Grid
hs.grid.setMargins(hs.geometry.size(0,0))
hs.grid.setGrid('2x2')

hs.hotkey.bind({"cmd", "alt"},'g',function()
  hs.grid.show()
end)

local bind = {"cmd", "alt"}
function SetWindowGrid(key, gridSettings)
  hs.hotkey.bind(bind, key, function()
    local win = hs.window.focusedWindow()
    hs.grid.set(win, gridSettings)
  end)
end

SetWindowGrid("left",   "0,0 1x2")
SetWindowGrid("right",  "1,0 1x2")
SetWindowGrid("up",     "0,0 2x1")
SetWindowGrid("down",   "0,1 2x1")
SetWindowGrid("return", "0,0 2x2")

-- Factory que descobre o nome automaticamente pelo Bundle ID
function createAppWatcher(bundleId, fridaScriptPath)
  local fridaTask = nil
  local appName = hs.application.nameForBundleID(bundleId)

  if not appName then
    print("Erro: Bundle ID inválido - " .. bundleId)
    return nil
  end

  local function activateFrida()
  
    if fridaTask then
      print(appName .. "stop")
      fridaTask:terminate()
    end

    fridaTask = hs.task.new("/Users/anderson/.local/bin/frida", nil, {
      "-n", appName,  -- Usa o nome descoberto automaticamente
      "-l", fridaScriptPath
    })

    fridaTask:start()
    print("Frida ativado para " .. appName .. " (" .. bundleId .. ")")
  end

   local watcher = hs.application.watcher.new(function(name, eventType, app)
     if app and app:bundleID() == bundleId then
       if eventType == hs.application.watcher.launched then
         print(appName .. " abriu")
         activateFrida()
         -- hs.timer.doAfter(2, activateFrida)
       elseif eventType == hs.application.watcher.terminated then
          print(appName .. " fechou")
          if fridaTask then
            print(appName .. " kill")
            fridaTask:terminate()
            fridaTask = nil
           end
        end
      end
    end)

   watcher:start()
   -- return watcher
end

createAppWatcher(
  "com.apple.ScreenContinuity",
  "/Users/anderson/iphone-mirroring-aot.js"
)

