(defalias 'perl-mode 'cperl-mode)
(add-hook 'cperl-mode-hook
          (lambda ()
            (set-face-bold-p 'cperl-array-face nil)
            (set-face-background 'cperl-array-face "black")
            (set-face-bold-p 'cperl-hash-face nil)
            (set-face-italic-p 'cperl-hash-face nil)
            (set-face-background 'cperl-hash-face "black")))

;; perlplus
(add-hook 'cperl-mode-hook
          (lambda ()
            (require 'perlplus)
            (local-set-key "\M-\t" 'perlplus-complete-symbol)
            (perlplus-setup)))
