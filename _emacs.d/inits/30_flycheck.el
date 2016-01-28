(add-hook 'python-mode-hook 'enh-ruby-mode)
(add-hook 'python-mode-hook 'php-mode)

;; (setq flycheck-display-errors-function nil)

(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
