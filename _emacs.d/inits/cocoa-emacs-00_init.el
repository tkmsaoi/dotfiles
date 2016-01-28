(setq ns-command-modifier 'meta)
(setq ns-alternate-modifier 'super)
(setq ns-pop-up-frames nil)

(define-key global-map [?\¥] [?\\])
(define-key global-map [?\C-¥] [?\C-\\])
(define-key global-map [?\M-¥] [?\M-\\])
(define-key global-map [?\C-\M-¥] [?\C-\M-\\])

(global-set-key (kbd "M-<RET>") 'ns-toggle-fullscreen)

(defun my-dired-open ()
  (interactive)
  (if (eq major-mode 'dired-mode)
      (let ((fname (dired-get-filename)))
        (start-process "open_ps" nil "open" fname)
        (message "open %s" fname))))

(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "C-<return>") 'my-dired-open)))

(set-face-attribute 'default nil
             :family "Monaco"
             :height 100)

(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "Hiragino Kaku Gothic ProN"))

(setq face-font-rescale-alist
      '((".*Hiragino_Kaku_Gothic_ProN.*" . 1.2)))

;; (set-default-font "Monaco-10")
