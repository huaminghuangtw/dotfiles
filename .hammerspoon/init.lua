local brightness = hs.brightness

-- Keep the screen dark long enough for the minimize animations to finish.
local DIM_DURATION = 0.5

local restoreTimer

local function minimizeAllWindows()
  for _, win in ipairs(hs.window.allWindows()) do
    if win:isStandard() and not win:isMinimized() then
      win:minimize()
    end
  end
end

local function minimizeAllBehindBlackScreen()
  if restoreTimer then return end

  local level = brightness.get()
  local dimmed = level and level > 0 and brightness.set(0)

  local ok, err = pcall(minimizeAllWindows)
  if not ok then hs.printf("minimize all windows failed: %s", tostring(err)) end

  if dimmed then
    restoreTimer = hs.timer.doAfter(DIM_DURATION, function()
      restoreTimer = nil
      brightness.set(level)
    end)
  end
end

hs.screenWatcher = hs.caffeinate.watcher.new(function(event)
  if event == hs.caffeinate.watcher.screensDidUnlock then
    minimizeAllBehindBlackScreen()
  end
end)
hs.screenWatcher:start()
