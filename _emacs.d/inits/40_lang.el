;;
;; C#
;;---

(add-hook 'csharp-mode-hook
          '(lambda()
             ;; (font-lock-add-magic-number)
             ;; (c-set-offset 'substatement-open 0)
             (c-set-offset 'arglist-intro '+)
             (c-set-offset 'arglist-cont 0)
             (c-set-offset 'arglist-cont-nonempty 0)
             (c-set-offset 'arglist-close 0)
             (c-set-offset 'member-init-cont 0)
             (c-set-offset 'member-init-intro 0)))

(require 'omnisharp)

(setq omnisharp-server-executable-path
      (concat (getenv "HOME") "/Sources/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe"))

(add-hook 'csharp-mode-hook '(lambda () (omnisharp-mode)))

;;
;; Groovy
;;---

(setq groovy-indent-offset 4)

;;
;; JavaScript
;;---

;; (setq js2-basic-offset 2)

(add-hook 'rjsx-mode-hook
          (lambda ()
            (setq js-indent-level 2)
            (setq js2-strict-trailing-comma-warning nil)
            (setq js-switch-indent-offset 2)
            ))

(add-hook 'json-mode-hook
          (lambda ()
            (setq js-indent-level 2)))

;; flycheck と競合するらしい
(setq js2-include-browser-externs nil)
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
(setq js2-highlight-external-variables nil)
(setq js2-include-jslint-globals nil)

;;
;; TypeScript
;;---

(setq typescript-indent-level 2)

;;
;; web-mode
;;---

(add-hook 'web-mode-hook
          (lambda ()
            (setq web-mode-markup-indent-offset 2)
            (setq web-mode-css-indent-offset 2)
            (setq web-mode-code-indent-offset 2)
            (setq web-mode-sql-indent-offset 2)
            ))

;;
;; Ruby
;;---

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

;;
;; Perl
;;---

(defalias 'perl-mode 'cperl-mode)
;; (add-hook 'cperl-mode-hook
;;           (lambda ()
;;             (set-face-bold-p 'cperl-array-face nil)
;;             (set-face-background 'cperl-array-face "black")
;;             (set-face-bold-p 'cperl-hash-face nil)
;;             (set-face-italic-p 'cperl-hash-face nil)
;;             (set-face-background 'cperl-hash-face "black")))

;;
;; PHP
;;---

(add-hook 'php-mode-hook
          (lambda ()
            (php-enable-psr2-coding-style)
            (setq show-trailing-whitespace nil)
            ))

(require 'ac-php)

;; (add-hook 'php-mode-hook 'flycheck-mode)

(add-hook 'php-mode-hook
          (lambda ()
            (ggtags-mode 1)))
(setq ggtags-completing-read-function nil)

;;
;; Shell Script
;;---

(add-hook 'sh-mode-hook '(lambda ()
                          (setq sh-basic-offset 2)
                          (setq sh-indentation 2)
                          ))

;;
;; Markdown
;;---

(setq markdown-fontify-code-blocks-natively t)
