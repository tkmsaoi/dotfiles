(require 'helm)
(require 'helm-config)

(helm-mode 1)

(setq helm-mode-fuzzy-match t)
(setq helm-split-window-default-side 'other)

(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))

(defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
  "Execute command only if CANDIDATE exists"
  (when (file-exists-p candidate)
    ad-do-it))
