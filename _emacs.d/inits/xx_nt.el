(setq default-file-name-coding-system 'sjis-dos)

(add-hook 'shell-mode-hook 
          (lambda ()
            (set-buffer-process-coding-system 'sjis-unix 'sjis-unix)))

(set-default-font "Consolas-10")
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  '("ÇlÇr ÉSÉVÉbÉN" . "unicode-bmp"))
(set-fontset-font (frame-parameter nil 'font)
                  'katakana-jisx0201
                  '("ÇlÇr ÉSÉVÉbÉN" . "unicode-bmp"))

(defun my-dired-open ()
  (interactive)
  (if (eq major-mode 'dired-mode)
      (let ((fname (dired-get-filename)))
        (w32-shell-execute "open" fname)
        (message "open %s" fname))))
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "C-<return>") 'my-dired-open)))
