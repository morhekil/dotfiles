(defconst mhl-javascript-packages
  '(
    add-node-modules-path
    company-flow
    eslintd-fix
    flycheck
    (flycheck-flow :toggle (configuration-layer/package-usedp 'flycheck))
    (company-flow :toggle (configuration-layer/package-usedp 'company))
    rjsx-mode))

(defun mhl-javascript/init-eslintd-fix ()
  (use-package eslintd-fix
    :defer t
    :commands eslintd-fix-mode
    :init
    (progn
      (add-hook 'rjsx-mode-hook #'eslintd-fix-mode t))))

(defun mhl-javascript/init-flycheck-flow ()
  (use-package flycheck-flow
    :config
    (progn 
      (flycheck-add-mode 'javascript-flow 'rjsx-mode)
      (flycheck-add-mode 'javascript-flow-coverage 'rjsx-mode)
      (flycheck-add-next-checker 'javascript-flow 'javascript-eslint)
      (flycheck-add-next-checker 'javascript-flow-coverage 'javascript-flow)
      )))

(defun mhl-javascript/init-company-flow ()
  (use-package company-flow
    :defer t
    :commands company-flow
    :init
    (spacemacs|add-company-backends
      :backends company-flow :modes js2-mode rjsx-mode)
    :config
    (add-to-list 'company-flow-modes 'rjsx-mode)))

(defun mhl-javascript/post-init-company-flow ()
  (spacemacs|add-company-backends
    :backends
    '((company-flow :with company-dabbrev-code)
      company-files)))


(defun mhl-javascript/init-rjsx-mode ()
  (use-package rjsx-mode
    :defer t
    :init
    (progn
      (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

      (setq
       js2-mode-show-strict-warnings nil
       js2-mode-show-parse-errors nil
       js-indent-level 2
       js2-basic-offset 2
       js2-strict-trailing-comma-warning nil
       js2-strict-missing-semi-warning nil)
      )
      (with-eval-after-load 'rjsx-mode
                                (define-key rjsx-mode-map (kbd "C-f") 'rjsx-delete-creates-full-tag))
    :config
    (modify-syntax-entry ?_ "w" js2-mode-syntax-table)))

(defun mhl-javascript/post-init-add-node-modules-path ()
  (with-eval-after-load 'rjsx-mode
    (add-hook 'rjsx-mode-hook #'add-node-modules-path)))

(defun mhl-javascript/post-init-flycheck ()
  (with-eval-after-load 'flycheck
    (spacemacs/set-leader-keys "en" 'flycheck-next-error)
    (spacemacs/set-leader-keys "ep" 'flycheck-previous-error)
    (push 'javascript-jshint flycheck-disabled-checkers)
    ;; (push 'json-jsonlint flycheck-disabled-checkers)
    (dolist (checker '(javascript-eslint javascript-standard))
      (flycheck-add-mode checker 'rjsx-mode)))

  (add-hook 'rjsx-mode-hook #'mhl-javascript/use-eslint-from-node-modules)
  (add-hook 'rjsx-mode-hook #'mhl-javascript/use-flow-from-node-modules)
  (spacemacs/enable-flycheck 'rjsx-mode))

;; (defun mhl-javascript/init-prettier-js ()
;;   (use-package prettier-js
;;     :defer t
;;     :init
;;     (progn
;;       (add-hook 'rjsx-mode-hook 'prettier-js-mode)
;;       (setq prettier-js-args '(
;;                                "--trailing-comma" "es5"
;;                                "--bracket-spacing" "false"
;;                                "--no-semi"
;;                                "--single-quote")))))
