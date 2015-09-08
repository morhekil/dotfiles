(setq ruby-min-packages
  '(
    bundler
    company
    ruby-mode
    minitest
    flycheck
    robe
    ruby-test-mode
    ruby-tools
    rvm
    yaml-mode))

(when ruby-version-manager
  (add-to-list 'ruby-min-packages ruby-version-manager))

(when ruby-enable-ruby-on-rails-support
  (add-to-list 'ruby-min-packages 'haml-mode)
  (add-to-list 'ruby-min-packages 'feature-mode)
  (add-to-list 'ruby-min-packages 'projectile-rails))

(defun ruby-min/init-rbenv ()
  "Initialize RBENV mode"
  (use-package rbenv
    :defer t
    :init (global-rbenv-mode)
    :config (add-hook 'ruby-mode-hook
                      (lambda () (rbenv-use-corresponding)))))

(defun ruby-min/init-rvm ()
  "Initialize RVM mode"
  (use-package rvm
    :defer t
    :init (rvm-use-default)
    :config (add-hook 'ruby-mode-hook
                      (lambda () (rvm-activate-corresponding-ruby)))))

(defun ruby-min/init-ruby-mode ()
  "Initialize Ruby Mode"
  (use-package ruby-mode
    :mode (("\\(Rake\\|Thor\\|Guard\\|Gem\\|Cap\\|Vagrant\\|Berks\\|Pod\\|Puppet\\)file\\'" . ruby-mode)
           ("\\.\\(rb\\|rabl\\|ru\\|builder\\|rake\\|thor\\|gemspec\\|jbuilder\\)\\'" . ruby-mode))
    :config
    (progn
      (setq enh-ruby-deep-indent-paren nil
            enh-ruby-hanging-paren-deep-indent-level 2)
      (sp-with-modes '(ruby-mode ruby-mode)
        (sp-local-pair "{" "}"
                       :pre-handlers '(sp-ruby-pre-handler)
                       :post-handlers '(sp-ruby-post-handler (spacemacs/smartparens-pair-newline-and-indent "RET"))
                       :suffix "")))))

(defun ruby-min/post-init-flycheck ()
  (add-hook 'ruby-mode-hook 'flycheck-mode))

(defun ruby-min/init-ruby-tools ()
  (use-package ruby-tools
    :defer t
    :init
    (add-hook 'ruby-mode-hook 'ruby-tools-mode)
    :config
    (spacemacs|hide-lighter ruby-tools-mode)))

(defun ruby-min/init-bundler ()
  (use-package bundler
    :defer t
    :init
    (progn
      (evil-leader/set-key-for-mode 'ruby-mode "mbc" 'bundle-check)
      (evil-leader/set-key-for-mode 'ruby-mode "mbi" 'bundle-install)
      (evil-leader/set-key-for-mode 'ruby-mode "mbs" 'bundle-console)
      (evil-leader/set-key-for-mode 'ruby-mode "mbu" 'bundle-update)
      (evil-leader/set-key-for-mode 'ruby-mode "mbx" 'bundle-exec))))

(defun ruby-min/init-projectile-rails ()
  (use-package projectile-rails
    :defer t
    :init
    (progn
      (add-hook 'ruby-mode-hook 'projectile-rails-on))
    :config
    (progn
      (spacemacs|diminish projectile-rails-mode " ?" " RoR")

      ;; Find files
      (evil-leader/set-key-for-mode 'ruby-mode
        "mrfa" 'projectile-rails-find-locale
        "mrfc" 'projectile-rails-find-controller
        "mrfe" 'projectile-rails-find-environment
        "mrff" 'projectile-rails-find-feature
        "mrfh" 'projectile-rails-find-helper
        "mrfi" 'projectile-rails-find-initializer
        "mrfj" 'projectile-rails-find-javascript
        "mrfl" 'projectile-rails-find-lib
        "mrfm" 'projectile-rails-find-model
        "mrfn" 'projectile-rails-find-migration
        "mrfo" 'projectile-rails-find-log
        "mrfp" 'projectile-rails-find-spec
        "mrfr" 'projectile-rails-find-rake-task
        "mrfs" 'projectile-rails-find-stylesheet
        "mrft" 'projectile-rails-find-test
        "mrfu" 'projectile-rails-find-fixture
        "mrfv" 'projectile-rails-find-view
        "mrfy" 'projectile-rails-find-layout
        "mrf@" 'projectile-rails-find-mailer
        ;; Goto file
        "mrgc" 'projectile-rails-find-current-controller
        "mrgd" 'projectile-rails-goto-schema
        "mrge" 'projectile-rails-goto-seeds
        "mrgh" 'projectile-rails-find-current-helper
        "mrgj" 'projectile-rails-find-current-javascript
        "mrgg" 'projectile-rails-goto-gemfile
        "mrgm" 'projectile-rails-find-current-model
        "mrgn" 'projectile-rails-find-current-migration
        "mrgp" 'projectile-rails-find-current-spec
        "mrgr" 'projectile-rails-goto-routes
        "mrgs" 'projectile-rails-find-current-stylesheet
        "mrgt" 'projectile-rails-find-current-test
        "mrgu" 'projectile-rails-find-current-fixture
        "mrgv" 'projectile-rails-find-current-view
        "mrgz" 'projectile-rails-goto-spec-helper
        "mrg." 'projectile-rails-goto-file-at-point
        ;; Rails external commands
        "mrcc" 'projectile-rails-generate
        "mri" 'projectile-rails-console
        "mrr:" 'projectile-rails-rake
        "mrxs" 'projectile-rails-server
        ;; Refactoring 'projectile-rails-mode
        "mrRx" 'projectile-rails-extract-region)
      ;; Ex-commands
      (evil-ex-define-cmd "A" 'projectile-toggle-between-implementation-and-test))))

(defun ruby-min/init-robe ()
  "Initialize Robe mode"
  (use-package robe
    :defer t
    :init
    (progn
      (add-hook 'ruby-mode-hook 'robe-mode)
      (when (configuration-layer/layer-usedp 'auto-completion)
        (push 'company-robe company-backends-ruby-mode)))
    :config
    (progn
      (spacemacs|hide-lighter robe-mode)
      ;; robe mode specific
      (evil-leader/set-key-for-mode 'enh-ruby-mode "mgg" 'robe-jump)
      (evil-leader/set-key-for-mode 'enh-ruby-mode "mhd" 'robe-doc)
      (evil-leader/set-key-for-mode 'enh-ruby-mode "mrsr" 'robe-rails-refresh)
      ;; inf-enh-ruby-mode
      (evil-leader/set-key-for-mode 'enh-ruby-mode "msf" 'ruby-send-definition)
      (evil-leader/set-key-for-mode 'enh-ruby-mode "msF" 'ruby-send-definition-and-go)
      (evil-leader/set-key-for-mode 'enh-ruby-mode "msi" 'robe-start)
      (evil-leader/set-key-for-mode 'enh-ruby-mode "msr" 'ruby-send-region)
      (evil-leader/set-key-for-mode 'enh-ruby-mode "msR" 'ruby-send-region-and-go)
      (evil-leader/set-key-for-mode 'enh-ruby-mode "mss" 'ruby-switch-to-inf))))

(defun ruby-min/init-yaml-mode ()
  "Initialize YAML mode"
  (use-package yaml-mode
    :mode (("\\.\\(yml\\|yaml\\)\\'" . yaml-mode)
           ("Procfile\\'" . yaml-mode))
    :config (add-hook 'yaml-mode-hook
                      '(lambda ()
                         (define-key yaml-mode-map "\C-m" 'newline-and-indent)))))

(defun ruby-min/init-feature-mode ()
  "Initialize Cucumber feature mode"
  (use-package feature-mode
    :mode (("\\.feature\\'" . feature-mode))))

(defun ruby-min/init-haml-mode ()
  (use-package haml-mode
    :defer t))

(defun ruby-min/init-minitest ()
  (use-package minitest
    :defer t
    :config
    (setq minitest-use-bundler nil)))

(defun ruby-min/init-ruby-test-mode ()
  "Define keybindings for ruby test mode"
  (use-package ruby-test-mode
    :defer t
    :init (add-hook 'ruby-mode-hook 'ruby-test-mode)
    :config
    (progn
      (spacemacs|hide-lighter ruby-test-mode)
      (evil-leader/set-key-for-mode 'ruby-mode "mtb" 'ruby-test-run)
      (evil-leader/set-key-for-mode 'ruby-mode "mtt" 'ruby-test-run-at-point))))

(when (configuration-layer/layer-usedp 'auto-completion)
  (defun ruby-min/post-init-company ()
    (spacemacs|add-company-hook ruby-mode)
    (eval-after-load 'company-dabbrev-code
      '(push 'ruby-mode company-dabbrev-code-modes))))
