(setq osxhacks-packages
  '(
  ;;   reveal-in-finder
    ))

(if (and (spacemacs/system-is-mac) (executable-find "gls")) 
    ;; maybe absolute or relative name of the `ls' program used by
    ;; `insert-directory'.
    ;; brew info coreutils
    (setq insert-directory-program "gls"
          dired-listing-switches "-aBhl --group-directories-first"))

;; (defun osxhacks/init-reveal-in-finder ()
;;   (use-package reveal-in-finder
;;     :if (spacemacs/system-is-mac)
;;     :commands reveal-in-finder))

