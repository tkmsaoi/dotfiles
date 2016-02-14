(require 'helm)
(require 'helm-config)

(helm-mode 1)

(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))

(setq helm-mode-fuzzy-match t)
;; (setq helm-M-x-fuzzy-match t)
;; (setq helm-buffers-fuzzy-matching t)
(setq helm-split-window-default-side 'other)
