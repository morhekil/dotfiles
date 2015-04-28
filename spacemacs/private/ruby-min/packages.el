;;; packages.el --- ruby-min Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar ruby-min-packages
  '(
    company
    flycheck
    robe
    ruby-test-mode
    ruby-version-manager
    yaml-mode
    haml-mode
    feature-mode
    projectile-rails)
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar ruby-min-excluded-packages '()
  "List of packages to exclude.")

(defun ruby-min/init-rvm ()
  "Initialize RVM mode"
  (use-package rvm
    :defer t
    :init (rvm-use-default)
    :config (add-hook 'ruby-mode-hook
                      (lambda () (rvm-activate-corresponding-ruby)))))

(defun ruby-min/init-projectile-rails ()
  (use-package projectile-rails
    :defer t
    :init
    (progn
      (add-hook 'ruby-mode-hook 'projectile-rails-on))
    :config
    (progn
      (spacemacs|diminish projectile-rails-mode " ⇋" " RoR")

      ;; Find files
      (evil-leader/set-key "mrfa" 'projectile-rails-find-locale)
      (evil-leader/set-key "mrfc" 'projectile-rails-find-controller)
      (evil-leader/set-key "mrfe" 'projectile-rails-find-environment)
      (evil-leader/set-key "mrff" 'projectile-rails-find-feature)
      (evil-leader/set-key "mrfh" 'projectile-rails-find-helper)
      (evil-leader/set-key "mrfi" 'projectile-rails-find-initializer)
      (evil-leader/set-key "mrfj" 'projectile-rails-find-javascript)
      (evil-leader/set-key "mrfl" 'projectile-rails-find-lib)
      (evil-leader/set-key "mrfm" 'projectile-rails-find-model)
      (evil-leader/set-key "mrfn" 'projectile-rails-find-migration)
      (evil-leader/set-key "mrfo" 'projectile-rails-find-log)
      (evil-leader/set-key "mrfp" 'projectile-rails-find-spec)
      (evil-leader/set-key "mrfr" 'projectile-rails-find-rake-task)
      (evil-leader/set-key "mrfs" 'projectile-rails-find-stylesheet)
      (evil-leader/set-key "mrft" 'projectile-rails-find-test)
      (evil-leader/set-key "mrfu" 'projectile-rails-find-fixture)
      (evil-leader/set-key "mrfv" 'projectile-rails-find-view)
      (evil-leader/set-key "mrfy" 'projectile-rails-find-layout)
      (evil-leader/set-key "mrf@" 'projectile-rails-find-mailer)
      ;; Goto file
      (evil-leader/set-key "mrgc" 'projectile-rails-find-current-controller)
      (evil-leader/set-key "mrgd" 'projectile-rails-goto-schema)
      (evil-leader/set-key "mrge" 'projectile-rails-goto-seeds)
      (evil-leader/set-key "mrgh" 'projectile-rails-find-current-helper)
      (evil-leader/set-key "mrgj" 'projectile-rails-find-current-javascript)
      (evil-leader/set-key "mrgg" 'projectile-rails-goto-gemfile)
      (evil-leader/set-key "mrgm" 'projectile-rails-find-current-model)
      (evil-leader/set-key "mrgn" 'projectile-rails-find-current-migration)
      (evil-leader/set-key "mrgp" 'projectile-rails-find-current-spec)
      (evil-leader/set-key "mrgr" 'projectile-rails-goto-routes)
      (evil-leader/set-key "mrgs" 'projectile-rails-find-current-stylesheet)
      (evil-leader/set-key "mrgt" 'projectile-rails-find-current-test)
      (evil-leader/set-key "mrgu" 'projectile-rails-find-current-fixture)
      (evil-leader/set-key "mrgv" 'projectile-rails-find-current-view)
      (evil-leader/set-key "mrgz" 'projectile-rails-goto-spec-helper)
      (evil-leader/set-key "mrg." 'projectile-rails-goto-file-at-point)
      ;; Rails external commands
      (evil-leader/set-key "mrcc" 'projectile-rails-generate)
      (evil-leader/set-key "mri" 'projectile-rails-console)
      (evil-leader/set-key "mrr:" 'projectile-rails-rake)
      (evil-leader/set-key "mrxs" 'projectile-rails-server)
      ;; Refactoring
      (evil-leader/set-key "mrRx" 'projectile-rails-extract-region))))

(defun ruby-min/post-init-flycheck ()
    (add-hook 'ruby-mode-hook 'flycheck-mode))

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

(defun ruby-min/init-ruby-test-mode ()
  "Define keybindings for ruby test mode"
  (use-package ruby-test-mode
    :defer t
    :init (add-hook 'ruby-mode-hook 'ruby-test-mode)
    :config
    (progn
      (spacemacs|hide-lighter ruby-test-mode)
      (evil-leader/set-key
        "mtb" 'ruby-test-run
        "mtt" 'ruby-test-run-at-point))))

(when (configuration-layer/layer-usedp 'auto-completion)
  (defun ruby-min/post-init-company ()
    (spacemacs|add-company-hook ruby-mode))

  (defun ruby-min/init-robe ()
    (use-package robe
      :if (configuration-layer/package-usedp 'company)
      :defer t
      :init (push 'company-robe company-backends-ruby-mode))))
