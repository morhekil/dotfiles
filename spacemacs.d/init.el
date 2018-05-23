;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')

   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     python
     ;; --------------------------------------------------------
     ;; Example of useful layers you may want to use right away
     ;; Uncomment a layer name and press C-c C-c to install it
     ;; --------------------------------------------------------
     auto-completion
     better-defaults
     (git :variables
          git-gutter-use-fringe t)
     markdown
     (org :variables org-enable-github-support t)
     syntax-checking
     go
     ruby
     ruby-on-rails
     html
     restclient
     mhl-javascript
     lua
     (git :variables
          git-magit-status-fullscreen t)
     ansible
     emacs-lisp
     shell
     osxhacks
     clojure
     haskell
     yaml
     deft
     elm
     terraform
     nginx
     csv
     ;; ivy

     ;; haskell config
     (haskell :variables haskell-enable-shm-support t)
     (haskell :variables haskell-enable-hindent-style "gibiansky")
     ;; ruby config
     (ruby :variables ruby-version-manager 'rvm)
     (ruby :variables ruby-test-runner 'rspec)

     ;; markdown config
     (markdown :variables markdown-live-preview-engine 'vmd)
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(ruby-rubylint)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/user-init ()
  (add-to-list 'exec-path "~/.cabal/bin/"))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."

  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progess in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to a .PNG file.
   ;; If the value is nil then no banner is displayed.
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner 'random
   ;; t if you always want to see the changelog at startup
   dotspacemacs-always-show-changelog t
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Iosevka"
                               :size 11
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state nil
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native t
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  ;;
  (setq solarized-use-less-bold t)
  (setq solarized-emphasize-indicators nil)
  (setq solarized-scale-org-headlines nil)
  (setq solarized-use-variable-pitch nil)
  ;; disable smartparens highlighting
  (setq sp-highlight-pair-overlay nil)
  (setq sp-highlight-wrap-overlay nil)
  (setq sp-highlight-wrap-tag-overlay nil)
  (setq scroll-margin 15)

  ;; indentation config
  (setq
   json-reformat:indent-width 2
   javascript-indent-level 2
   js-indent-level 2
   json-indent-level 2
   standard-indent 2
   js2-basic-offset 2
   clean-aindent-mode t
   indent-guide-delay 0.3
   indent-tabs-mode nil
   js-indent-level 2
   json-reformat:indent-width 2
   standard-indent 2
   css-indent-offset 2
   web-mode-standard-indent 2
   web-mode-code-indent-offset 2
   web-mode-indent-style 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-attr-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-css-indent-offset 2)
  (setq whitespace-style '(face empty tabs lines-tail trailing))
  (setq whitespace-action '(auto-cleanup))

  ;; automatically scale font when window size changed
  (defun mhl-font-scale-on-frame-width ()
    (if (> (frame-width) 200) (text-scale-set 0.5) (text-scale-set 0)))
  (add-hook 'window-configuration-change-hook 'mhl-font-scale-on-frame-width)
)

(defun dotspacemacs/user-config ()
  "User Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  (setq-default flycheck-disabled-checkers '(ruby-reek))
  ;; highlight long lines and extra spaces
  ;; (global-whitespace-mode t)
  ;; (remove-hook 'go-mode-hook 'whitespace-mode)

  ;; go-mode setup
  (setenv "GOPATH" "/Users/Saruman/go")
  ;; (add-hook 'before-save-hook 'gofmt-before-save)
  (setq gofmt-command "goimports")
  (setq go-use-gometalinter t)
  ;; start server on launch
  (server-start)
  ;; customize solarize's color selection
  (custom-set-faces
    '(font-lock-constant-face ((t (:foreground "#cb4b16" :weight unspecified)))))

  (add-to-list 'auto-mode-alist '("\\.liquid\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.es6\\'" . rjsx-mode))
  ;; vcs settings
  (setq vc-follow-symlinks nil)

  ;; deft notes location
  (setq deft-directory "~/Dropbox/Notes")
  (setq deft-use-filename-as-title t)
)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (winum unfill restclient-helm ob-restclient fuzzy company-restclient know-your-http-well company-ansible csv-mode vmd-mode hcl-mode powerline rake pcre2el org alert log4e gntp markdown-mode skewer-mode simple-httpd json-snatcher json-reformat js2-mode parent-mode projectile request haml-mode gitignore-mode pos-tip flycheck flx magit magit-popup git-commit with-editor smartparens iedit anzu evil goto-chg undo-tree diminish web-completion-data dash-functional tern go-mode ghc haskell-mode company hydra inflections edn multiple-cursors paredit peg eval-sexp-fu highlight cider seq spinner queue pkg-info clojure-mode epl inf-ruby bind-map bind-key yasnippet packed f s helm avy helm-core async auto-complete popup package-build nginx-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic yaml-mode xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org terraform-mode tagedit spacemacs-theme spaceline solarized-theme smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restclient restart-emacs rbenv rainbow-delimiters quelpa pug-mode projectile-rails popwin persp-mode paradox ox-gfm orgit org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file ob-http neotree mwim multi-term move-text mmm-mode minitest markdown-toc magit-gitflow macrostep lua-mode lorem-ipsum livid-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc jinja2-mode intero info+ indent-guide ido-vertical-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets google-translate golden-ratio go-guru go-eldoc gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md flycheck-pos-tip flycheck-haskell flycheck-elm flx-ido fill-column-indicator feature-mode fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eshell-z eshell-prompt-extras esh-help emmet-mode elm-mode elisp-slime-nav dumb-jump deft define-word company-web company-tern company-statistics company-go company-ghci company-ghc company-cabal column-enforce-mode coffee-mode cmm-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu chruby bundler auto-yasnippet auto-highlight-symbol auto-compile ansible-doc ansible aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck-flow company-flow org-brain evil-org zenburn-theme symon string-inflection sayid ruby-refactor password-generator org-category-capture monokai-theme window-purpose imenu-list impatient-mode godoctor go-rename evil-lion editorconfig dante company-lua dash wgrep smex ivy-purpose ivy-hydra counsel-projectile counsel swiper ivy rjsx-mode eslintd-fix helm-purpose winum unfill restclient-helm ob-restclient fuzzy company-restclient know-your-http-well company-ansible csv-mode vmd-mode hcl-mode powerline rake pcre2el org alert log4e gntp markdown-mode skewer-mode simple-httpd json-snatcher json-reformat js2-mode parent-mode projectile request haml-mode gitignore-mode pos-tip flycheck flx magit magit-popup git-commit with-editor smartparens iedit anzu evil goto-chg undo-tree diminish web-completion-data dash-functional tern go-mode ghc haskell-mode company hydra inflections edn multiple-cursors paredit peg eval-sexp-fu highlight cider seq spinner queue pkg-info clojure-mode epl inf-ruby bind-map bind-key yasnippet packed f s helm avy helm-core async auto-complete popup package-build nginx-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic yaml-mode xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org terraform-mode tagedit spacemacs-theme spaceline solarized-theme smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restclient restart-emacs rbenv rainbow-delimiters quelpa pug-mode projectile-rails popwin persp-mode paradox ox-gfm orgit org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file ob-http neotree mwim multi-term move-text mmm-mode minitest markdown-toc magit-gitflow macrostep lua-mode lorem-ipsum livid-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc jinja2-mode intero info+ indent-guide ido-vertical-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets google-translate golden-ratio go-guru go-eldoc gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md flycheck-pos-tip flycheck-haskell flycheck-elm flx-ido fill-column-indicator feature-mode fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eshell-z eshell-prompt-extras esh-help emmet-mode elm-mode elisp-slime-nav dumb-jump deft define-word company-web company-tern company-statistics company-go company-ghci company-ghc company-cabal column-enforce-mode coffee-mode cmm-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu chruby bundler auto-yasnippet auto-highlight-symbol auto-compile ansible-doc ansible aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)

(defun spacemacs/error-delegate ()
  "Override spacemacs error-delegate to always default to flycheck"
  'flycheck)
