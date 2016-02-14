(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

(add-hook 'enh-ruby-mode-hook '(lambda ()
                                 ;; (ruby-electric-mode t)
                                 ;; (inf-ruby-keys)
                                 ;; (add-to-list 'electric-pair-pairs '(?| . ?|))
                                 ))

;; (remove-hook 'enh-ruby-mode-hook 'erm-define-faces)

;; (setq enh-ruby-deep-arglist nil)
(setq enh-ruby-deep-indent-paren nil)
;; (setq enh-ruby-deep-indent-paren-style nil)
