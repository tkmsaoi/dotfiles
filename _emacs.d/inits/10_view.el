(setq inhibit-startup-message t)
(setq frame-title-format (format "%%f" (system-name)))
(menu-bar-mode -1)
(line-number-mode t)
(column-number-mode t)
(setq resize-mini-windows nil)
(setq visible-bell t)

(when window-system
  (progn
    (tool-bar-mode -1)
    (set-scroll-bar-mode 'right)))

(add-to-list 'default-frame-alist '(width . 100))
(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(top . 0))
(add-to-list 'default-frame-alist '(left . 0))

(add-to-list 'default-frame-alist '(foreground-color . "white"))
(add-to-list 'default-frame-alist '(background-color . "black"))
(add-to-list 'default-frame-alist '(cursor-color . "green"))
(add-to-list 'default-frame-alist '(alpha . (85 85 85 85)))
