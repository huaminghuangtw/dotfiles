hs.screenWatcher = hs.caffeinate.watcher.new(function(event)
  if event == hs.caffeinate.watcher.screensDidUnlock then
    for _, win in ipairs(hs.window.allWindows()) do win:minimize() end
  end
end)
hs.screenWatcher:start()
