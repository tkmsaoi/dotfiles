(add-hook 'php-mode-hook
          (lambda ()
            (ggtags-mode 1)))

(setq ggtags-completing-read-function nil)
