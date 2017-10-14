(when (spacemacs/system-is-mac)
  (progn
    (evil-leader/set-key "bf" 'reveal-in-finder)
    (evil-leader/set-key "oy" 'pasteboard-copy)
    (evil-leader/set-key "op" 'pasteboard-paste)

    (when osx-use-option-as-meta
      ;; Treat option as meta
      (setq mac-option-key-is-meta t)
      (setq mac-option-modifier 'meta))

    ;; Treat command as super
    (setq mac-command-key-is-meta nil)
    (setq mac-command-modifier 'super)

    (isolate-kill-ring)
    ;; bind CMD+C to pasteboard-copy
    (global-set-key (kbd "s-c") 'pasteboard-copy)
    ;; bind CMD+V to pasteboard-paste
    (global-set-key (kbd "s-v") 'pasteboard-paste)
    ;; bind CMD+X to pasteboard-cut
    (global-set-key (kbd "s-x") 'pasteboard-cut)
    ;; CMD-S-F to toggle fullscreen
    (global-set-key (kbd "C-s-f") 'spacemacs/toggle-frame-fullscreen)))

