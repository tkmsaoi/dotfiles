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
 '(package-selected-packages
   '(yasnippet yaml-mode wgrep-ag typescript-mode smartparens s ruby-electric recentf-ext projectile php-mode omnisharp magit markdown-mode js2-mode hlinum helm-projectile helm-ag helm groovy-mode ggtags flycheck exec-path-from-shell enh-ruby-mode emmet-mode elixir-mode editorconfig dracula-theme csharp-mode company ag ac-php)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
