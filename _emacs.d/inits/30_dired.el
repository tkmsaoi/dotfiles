(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

(setq ls-lisp-dirs-first t) ;; directory top
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)
