(setq ns-command-modifier 'meta)
(setq ns-alternate-modifier 'super)
(setq ns-pop-up-frames nil)

(define-key global-map [?\¥] [?\\])
(define-key global-map [?\C-¥] [?\C-\\])
(define-key global-map [?\M-¥] [?\M-\\])
(define-key global-map [?\C-\M-¥] [?\C-\M-\\])

(global-set-key (kbd "M-<RET>") 'ns-toggle-fullscreen)

(set-default-font "Monaco-11")

(defun my-dired-open ()
  (interactive)
  (if (eq major-mode 'dired-mode)
      (let ((fname (dired-get-filename)))
        (start-process "open_ps" nil "open" fname)
        (message "open %s" fname))))

(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "C-<return>") 'my-dired-open)))
