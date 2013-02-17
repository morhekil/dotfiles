var hyper = "ctrl;shift;alt;cmd";
var focus_iterm = slate.operation("focus", { app: "iTerm" });
var focus_chrome = slate.operation("focus", { app: "Google Chrome" });

slate.bind("a:"+hyper, function(win) {
  var appName = win.app().name();
  if (appName == "iTerm") { focus_chrome.run() };
  if (appName == "Google Chrome") { focus_iterm.run(); }
});
