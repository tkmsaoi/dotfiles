(require 'helm)
(require 'helm-config)

(helm-mode 1)

(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))

(setq helm-M-x-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
