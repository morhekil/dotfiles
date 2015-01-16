;; -*- lexical-binding: t; -*-

;; less agressive GC
(setq gc-cons-threshold 20000000)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'package)
;; (push '("marmalade" . "http://marmalade-repo.org/packages/")
;;       package-archives )
(push '("melpa" . "http://melpa.milkbox.net/packages/")
      package-archives)
(package-initialize)

(setq evil-shift-width 2)
(setq evil-want-C-u-scroll t)
(setq evil-toggle-key "C-c z")
(evil-mode 1)
;; enable evil mode in all buffers
(setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
(setq evil-emacs-state-modes nil)
;; matchit
(require 'evil-matchit)
(global-evil-matchit-mode 1)

;; flx-ido setup
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-create-new-buffer 'always)
(setq ido-auto-merge-work-directories-length -1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq flx-ido-threshold 1000)

(projectile-global-mode)
(setq projectile-enable-caching t)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-c o") 'ff-find-other-file)

(load-theme 'solarized-light t)

(setq flycheck-indication-mode nil) 
(add-hook 'after-init-hook #'global-flycheck-mode)

;; go-mode setup
;; (add-hook 'before-save-hook 'go-remove-unused-imports)
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
			  (define-key (current-local-map) (kbd "C-c C-f") 'godef-jump)
			  (define-key (current-local-map) (kbd "C-x 4 C-c C-f") 'godef-jump-other-window)
			  ))

;; highlighting parentheses
(show-paren-mode 1)
(setq show-paren-delay 0)

;; ;; line numbers
(setq linum-format "%3d ")
(global-linum-mode 1)

;; copy into OSX clipboard
(require 'pbcopy)
(turn-on-pbcopy)

;; backups
(setq
 backup-by-copying t      ; don't clobber symlinks
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))    ; don't litter my fs tree
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; auto-complete
(setq company-idle-delay 0)
(setq completion-styles '(initials basic partial-completion))
(add-hook 'after-init-hook 'global-company-mode)

;; kill all buffers
(defun kill-all-buffers ()
  "Kill all buffers."
  (interactive)
  (mapc 'kill-buffer (buffer-list)))
(define-key global-map (kbd "C-c \\ b d") 'kill-all-buffers)

;; smart parenthesis
(require 'smartparens-config)
(sp-pair "\"" nil :actions :rem)
(setq sp-autoescape-string-quote nil)
;; (smartparens-global-mode t)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(setq web-mode-enable-css-colorization t)
(setq scss-compile-at-save nil)

;; Ruby/Rails setup
(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it))
(ad-activate 'rspec-compile)
(add-to-list 'auto-mode-alist '("\\.rjs$" . ruby-mode))
(setq rspec-use-rake-when-possible nil)
(setq rspec-use-bundler-when-possible nil)
(add-hook 'ruby-mode-hook (lambda() (modify-syntax-entry ?_ "w")))
(add-hook 'ruby-mode-hook (lambda () (local-set-key (kbd "RET") 'newline-and-indent)))

;; Uniquify duplicate buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;; org mode setup
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; dired setup
(autoload 'dired-jump "dired-x"
  "Jump to Dired buffer corresponding to current buffer." t)
(autoload 'dired-jump-other-window "dired-x"
  "Like \\[dired-jump] (dired-jump) but in other window." t)
(define-key global-map (kbd "C-x C-j") 'dired-jump)
(define-key global-map (kbd "C-x 4 C-j") 'dired-jump-other-window)
(define-key evil-normal-state-map (kbd "C-x j") 'dired-jump)
(define-key evil-normal-state-map (kbd "C-x 4 j") 'dired-jump-other-window)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" "e56f1b1c1daec5dbddc50abd00fcd00f6ce4079f4a7f66052cf16d96412a09a9" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" default)))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl)))
(add-hook 'coffee-mode-hook (lambda() (modify-syntax-entry ?_ "w")))

;; command-line shell
(define-key comint-mode-map (kbd "<up>") 'comint-previous-input)
(define-key comint-mode-map (kbd "<down>") 'comint-next-input)

;; disable tramp, hangs with ssh console messages in the console
(tramp-unload-tramp)

;; ESS setup
(setq inferior-R-program-name "/usr/local/bin/R")
(load "ess-site.el")

;; Haskell setup
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-hi2)

;; Smart-mode-line setup
(sml/setup)
(let ((default-color (cons (face-background 'mode-line)
				   (face-foreground 'mode-line))))
  (add-hook 'post-command-hook
	    (lambda ()
	      (let ((color (cond ((minibufferp) default-color)
				 ((evil-insert-state-p) '("#e80000" . "#ffffff"))
				 ((evil-emacs-state-p)  '("#af00d7" . "#ffffff"))
				 ;; ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
				 ((buffer-modified-p)   default-color)
				 (t default-color))))
		(set-face-background 'mode-line (car color))
		(set-face-foreground 'mode-line (cdr color))))))
