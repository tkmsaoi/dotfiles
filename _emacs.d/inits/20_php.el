(require 'php-mode)

(add-hook 'php-mode-hook
          (lambda ()
            ;; (c-set-style "stroustrup")
            ;; (c-set-offset 'case-label 4)
            ;; (c-set-offset 'arglist-intro 4)
            ;; (c-set-offset 'arglist-cont-nonempty 4)
            ;; (c-set-offset 'arglist-close 0)
            ;; (setq php-mode-coding-style 'pear)
            ;; (setq php-mode-coding-style 'drupal)
            (php-enable-psr2-coding-style)
            (set (make-local-variable 'indent-tabs-mode) t)))
