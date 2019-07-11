
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/site-lisp")

(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

(if (file-exists-p "~/.emacs.local")
 (load "~/.emacs.local"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(package-selected-packages
   (quote
    (yasnippet yaml-mode wgrep-ag typescript-mode smartparens s ruby-electric recentf-ext projectile php-mode omnisharp magit markdown-mode js2-mode hlinum helm-projectile helm-ag helm groovy-mode ggtags flycheck exec-path-from-shell enh-ruby-mode emmet-mode elixir-mode editorconfig dracula-theme csharp-mode company ag ac-php))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
