require("hs.ipc") -- enables the `hs` command-line interface

local LOCK_SETTLE_DELAY = 1.0 -- seconds after locking, once the lock screen covers the display
local FINDER_BUNDLE_ID = "com.apple.finder" -- owns the desktop icons

local locked = false

local function hideAppsWithWindows()
  for _, app in ipairs(hs.application.runningApplications()) do
    if app:bundleID() ~= FINDER_BUNDLE_ID and #app:allWindows() > 0 then
      app:hide()
    end
  end
end

local function minimizeAllWindows()
  for _, win in ipairs(hs.window.allWindows()) do
    if not win:isMinimized() then win:minimize() end
  end
end

local function revealDesktop()
  -- Hiding is instant but minimizing animates, so hide first and the minimize is never seen.
  hideAppsWithWindows()
  minimizeAllWindows()
end

local screenWatcher = hs.caffeinate.watcher.new(function(event)
  if event == hs.caffeinate.watcher.screensDidLock then
    locked = true
    hs.timer.doAfter(LOCK_SETTLE_DELAY, function()
      if locked then hideAppsWithWindows() end
    end)
  elseif event == hs.caffeinate.watcher.screensDidUnlock then
    locked = false
    revealDesktop()
  end
end)
screenWatcher:start()

hs.autoLaunch(true)
hs.showDesktop = revealDesktop
