(add-hook 'csharp-mode-hook
          '(lambda()
             ;; (font-lock-add-magic-number)
             ;; (c-set-offset 'substatement-open 0)
             (c-set-offset 'arglist-intro '+)
             (c-set-offset 'arglist-cont 0)
             (c-set-offset 'arglist-cont-nonempty 0)
             (c-set-offset 'arglist-close 0)
             (c-set-offset 'member-init-cont 0)
             (c-set-offset 'member-init-intro 0)
             ))