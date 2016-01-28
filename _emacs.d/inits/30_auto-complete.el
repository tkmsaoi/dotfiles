(require 'auto-complete-config)

(global-auto-complete-mode t)

(setq ac-use-menu-map t)
(setq ac-use-fuzzy t)
(setq ac-auto-start t)

(defun my-ac-setup ()
  (setq ac-sources
        (append '(
                  ac-source-yasnippet
                  ac-source-words-in-same-mode-buffers
                  ) ac-sources)))

(add-hook 'php-mode-hook 'my-ac-setup)
(add-hook 'csharp-mode-hook 'my-ac-setup)

(ac-linum-workaround)
