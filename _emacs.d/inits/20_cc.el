(add-hook 'c-mode-common-hook
          '(lambda ()
             (c-set-style "stroustrup")
             (setq c-basic-offset 4)))
