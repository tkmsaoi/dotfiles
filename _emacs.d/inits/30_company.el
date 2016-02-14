(setq company-idle-delay .3)
(setq company-echo-delay .3)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)

(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'php-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 '((
                    company-yasnippet
                    :with
                    company-gtags
                    company-dabbrev-code
                    )))
            (setq company-transformers '(company-sort-by-backend-importance))
            ))

(add-hook 'csharp-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 '((
                    company-yasnippet
                    :with
                    company-omnisharp
                    )))
            (setq company-transformers '(company-sort-by-backend-importance))
            ))
