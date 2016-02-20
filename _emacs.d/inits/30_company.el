(setq company-idle-delay .3)
(setq company-echo-delay .3)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)

(with-eval-after-load 'company-dabbrev-code
  (setq company-dabbrev-code-other-buffers nil))

(with-eval-after-load 'company-gtags
  (setq company-gtags-insert-arguments nil))

(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'php-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 '((
                    company-yasnippet
                    :with
                    company-gtags
                    ;; company-ac-php-backend
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
