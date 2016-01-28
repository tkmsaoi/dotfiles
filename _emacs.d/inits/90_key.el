(global-set-key (kbd "C-x a") 'rename-buffer)
(global-set-key (kbd "C-x A") 'my-rename-system-buffer)

;; (global-set-key (kbd "M-c") 'anything-coding-system)
;; (global-set-key (kbd "M-f") 'anything-for-files)
;; (global-set-key (kbd "M-m") 'anything-minibuffer-history)

(global-set-key (kbd "C-c a") 'ag)

(global-unset-key (kbd "C-z"))

;; dired
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; omnisharp
(define-key omnisharp-mode-map (kbd "C-c o u") 'omnisharp-helm-find-usages)
(define-key omnisharp-mode-map (kbd "C-c o r") 'omnisharp-rename)
(define-key omnisharp-mode-map (kdb "C-c o d") 'omnisharp-go-to-definition)
(define-key omnisharp-mode-map "." 'omnisharp-add-dot-and-auto-complete)
(define-key omnisharp-mode-map "\M-/" 'omnisharp-auto-complete)
