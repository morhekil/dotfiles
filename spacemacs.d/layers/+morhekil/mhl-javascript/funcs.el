(defun mhl-javascript/use-eslint-from-node-modules ()
      (let* ((root (locate-dominating-file
                     (or (buffer-file-name) default-directory)
                     "node_modules"))
             (global-eslintd (executable-find "eslint_d"))
             (global-eslint (executable-find "eslint"))
             (local-eslint (expand-file-name "node_modules/.bin/eslint"
                                             root))
             (eslint (if (and local-eslint (file-executable-p local-eslint))
                       local-eslint
                       global-eslint))
             (eslintex (if (and global-eslintd (file-executable-p global-eslintd))
                          global-eslintd
                          eslint)))
        (setq-local flycheck-javascript-eslint-executable eslint)))

(defun mhl-javascript/use-flow-from-node-modules ()
  (let* ((root (locate-dominating-file
                 (or (buffer-file-name) default-directory)
                 "node_modules"))
         (global-flow (executable-find "flow"))
         (local-flow (expand-file-name "node_modules/.bin/flow"
                                      root))
         (flow (if (and local-flow (file-executable-p local-flow)) local-flow global-flow)))
      (setq-local flycheck-javascript-flow-executable flow)
      (setq-local flycheck-javascript-flow-coverage-executable flow)
      ))