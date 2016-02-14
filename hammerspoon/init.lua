local hyper = {"cmd", "alt", "ctrl", "shift"}

hs.hotkey.bind(hyper, "Q", function()
  hs.application.launchOrFocus("Sequel Pro")
end)

hs.hotkey.bind(hyper, "D", function()
  hs.application.launchOrFocus("Postbox")
end)

hs.hotkey.bind(hyper, "C", function()
  hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind(hyper, "E", function()
  hs.application.launchOrFocus("Emacs")
end)

hs.hotkey.bind(hyper, "F", function()
  hs.application.launchOrFocus("iTerm")
end)

hs.hotkey.bind(hyper, "W", function()
  hs.application.launchOrFocus("MoneyWell")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "X", function()
    hs.window.focusedWindow():maximize()
end)
