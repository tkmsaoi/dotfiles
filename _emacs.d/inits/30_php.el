(add-hook 'php-mode-hook
          (lambda ()
            (php-enable-psr2-coding-style)
            (setq show-trailing-whitespace nil)
            ))
