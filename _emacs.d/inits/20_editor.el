(add-hook 'after-init-hook
          '(lambda ()
             (cd "~")
             (dired "~")))

(setq user-full-name "Takamasa Aoi")
(setq user-mail-address "tkms.aoi@gmail.com")

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq confirm-kill-emacs 'y-or-n-p)

(prefer-coding-system 'utf-8-unix)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default truncate-lines t)

(setq indent-line-function 'indent-relative-maybe)

(recentf-mode 1)

;; Startup message
(setq inhibit-startup-message t)

(setq resize-mini-windows nil)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(fringe-mode 0)

;; Mode line
(setq frame-title-format (format "%%f" (system-name)))
(line-number-mode t)
(column-number-mode t)


;; Paren highlighting
(show-paren-mode t)
(setq show-paren-delay 0)

;; Current line highlighting
(global-hl-line-mode 1)

;; Line number
(global-linum-mode 1)

(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat " %" (number-to-string w) "d  ")))
    ad-do-it))

;; Cursor blinking
(blink-cursor-mode 0)

;; Window
(add-to-list 'default-frame-alist '(alpha . (90 90 90 90)))
(add-to-list 'default-frame-alist '(width . 120))
(add-to-list 'default-frame-alist '(height . 60))

;;
;; Mode Line
;;---

(defvar my-mode-line-mode-alist
  '(
    (abbrev-mode . "")
    (company-mode . "")
    (helm-mode . "")
    (projectile-mode . "")
    (smartparens-mode . "")
    (yas-minor-mode . "")

    (csharp-mode . "C#")
    (dired-mode . "Dired")
    (php-mode . "PHP")
    (typescript-mode . "TypeScript")
    ))

(defun my-modify-mode-line-modes ()
  (interactive)
  (loop for (mode . mode-str) in my-mode-line-mode-alist
        do
        (let ((old-mode-str (cdr (assq mode minor-mode-alist))))
          (when old-mode-str
            (setcar old-mode-str mode-str))
          (when (eq mode major-mode)
            (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'my-modify-mode-line-modes)
