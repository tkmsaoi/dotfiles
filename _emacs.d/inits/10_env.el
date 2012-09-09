(setq make-backup-files nil)
(setq auto-save-default nil)

(autoload 'ansi-color-for-comint-mode-on "ansi-color"
  "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'comint-mode-hook (lambda () (setq comint-process-echoes t)))
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
