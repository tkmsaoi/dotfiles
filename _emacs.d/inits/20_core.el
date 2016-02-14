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

(recentf-mode 1)

;; abbrev
(setq abbrev-mode nil)
(setq default-abbrev-mode nil)
(setq dabbrev-case-fold-search nil)

;; (electric-pair-mode t)


;;; Appearances

;; Startup message
(setq inhibit-startup-message t)

(global-font-lock-mode t)
(setq resize-mini-windows nil)

;; Menu bar
(menu-bar-mode 0)

;; Tool bar
(tool-bar-mode 0)

;; Scroll bar
(scroll-bar-mode 0)

;; Fringe
(fringe-mode 0)

;; Mode line
(setq frame-title-format (format "%%f" (system-name)))
(line-number-mode t)
(column-number-mode t)

;; Truncate lines
(setq-default truncate-lines t)

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
;; (blink-cursor-mode 0)

;; Window alpha
(add-to-list 'default-frame-alist '(alpha . (90 90 90 90)))

(autoload 'ansi-color-for-comint-mode-on "ansi-color"
  "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'comint-mode-hook (lambda () (setq comint-process-echoes t)))


;; Mode Line

(setq-default mode-line-format
      '(
       "%e"
       mode-line-front-space

       mode-line-mule-info
       mode-line-modified
       mode-line-remote

       mode-line-frame-identification
       mode-line-buffer-identification
       "    "

       mode-line-position
       "  "

       mode-line-modes
       "  "

       (vc-mode vc-mode)

       ;; mode-line-misc-info

       mode-line-end-spaces
       ))

(defvar my-mode-line-mode-alist
  '(
    (abbrev-mode . "")
    (company-mode . "")
    (flycheck-mode . "+fc")
    (ggtags-mode . "+gg")
    (helm-mode . "")
    (omnisharp-mode . "+os")
    (projectile-mode . "")
    (smartparens-mode . "")
    (yas-minor-mode . "")

    (csharp-mode . "C#")
    (dired-mode . "Dired")
    (php-mode . "PHP")
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
