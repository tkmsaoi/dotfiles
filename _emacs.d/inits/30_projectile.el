(projectile-global-mode)

(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; (setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

;; (setq projectile-git-command "ag -nocolor -l -0")

(setq projectile-switch-project-action 'projectile-dired)
