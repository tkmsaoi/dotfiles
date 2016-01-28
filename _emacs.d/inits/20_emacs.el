(setq user-full-name "Takamasa Aoi")
(setq user-mail-address "tkms.aoi@gmail.com")

;;; Editor

(setq make-backup-files nil)
(setq auto-save-default nil)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(prefer-coding-system 'utf-8-unix)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'indent-relative-maybe)

(electric-pair-mode t)

(setq abbrev-mode nil)
(setq default-abbrev-mode nil)
(setq dabbrev-case-fold-search nil)

(recentf-mode 1)


;;; Appearances

(setq inhibit-startup-message t)

(global-font-lock-mode t)

;; (setq-default truncate-lines t)
(setq-default truncate-lines t)

;; (setq whitespace-style '(tabs tab-mark spaces space-mark))
;; (setq whitespace-space-regexp "\\(\x3000+\\)")
;; (setq whitespace-display-mappings
      ;; '(
        ;; (space-mark ?\x3000 [?\□])
        ;; (tab-mark   ?\t   [?\xBB ?\t])
        ;; ))

;; (global-whitespace-mode 1)
;; (set-face-foreground 'whitespace-space "LightSlateGray")
;; (set-face-background 'whitespace-space "DarkSlateGray")
;; (set-face-foreground 'whitespace-tab "LightSlateGray")
;; (set-face-background 'whitespace-tab "DarkSlateGray")

(show-paren-mode t)
(setq show-paren-delay 0)
;; (setq show-paren-style 'mixed)

(global-hl-line-mode 1)

(setq frame-title-format (format "%%f" (system-name)))
(line-number-mode t)
(column-number-mode t)
(menu-bar-mode -1)
;; (fringe-mode -1)
(global-linum-mode 1)
(setq resize-mini-windows nil)

(when window-system
  (progn
    (tool-bar-mode -1)
    (set-scroll-bar-mode 'right)))

(blink-cursor-mode 0)

;; (setq visible-bell t)

;; (add-to-list 'default-frame-alist '(width . 100))
;; (add-to-list 'default-frame-alist '(height . 40))
;; (add-to-list 'default-frame-alist '(top . 0))
;; (add-to-list 'default-frame-alist '(left . 0))

;; (add-to-list 'default-frame-alist '(foreground-color . "white"))
;; (add-to-list 'default-frame-alist '(background-color . "black"))
;; (add-to-list 'default-frame-alist '(cursor-color . "green"))
(add-to-list 'default-frame-alist '(alpha . (90 90 90 90)))

(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat " %" (number-to-string w) "d ")))
    ad-do-it))

(autoload 'ansi-color-for-comint-mode-on "ansi-color"
  "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'comint-mode-hook (lambda () (setq comint-process-echoes t)))
