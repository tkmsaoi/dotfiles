(autoload 'php-mode "php-mode")
(setq php-mode-force-pear t)
(add-hook 'php-mode-hook
          '(lambda ()
             (c-set-style "stroustrup")
             (set (make-local-variable 'indent-tabs-mode) nil)))
