(global-unset-key (kbd "C-z"))

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x a") 'rename-buffer)
(global-set-key (kbd "C-x A") 'my-rename-system-buffer)
(global-set-key (kbd "C-x C-n") 'my-new-untitled-buffer)


(global-set-key (kbd "M-{") 'previous-buffer)
(global-set-key (kbd "M-}") 'next-buffer)

(global-set-key (kbd "M-,") 'pop-tag-mark)
(global-unset-key (kbd "M-*"))

;; dired
;; (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; helm
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-c h a") 'helm-ag)
(global-set-key (kbd "C-c h e") 'helm-recentf)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
;; (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

;; ag
(global-unset-key (kbd "M-s a"))
(global-set-key (kbd "M-s a") 'ag)

;; company
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map [tab] 'company-complete-selection)
  (define-key company-active-map (kbd "TAB") 'company-complete-selection))

;; ggtags
(with-eval-after-load 'ggtags
  (define-key ggtags-mode-map (kbd "M-.") 'ggtags-find-definition)
  (define-key ggtags-mode-map (kbd "M-/") 'ggtags-find-reference)

  (define-key ggtags-navigation-map (kbd "M-<") nil)
  (define-key ggtags-navigation-map (kbd "M->") nil)

  (setq ggtags-mode-prefix-key (kbd "C-c t"))
  (setq ggtags-mode-prefix-map
        (let ((map (make-sparse-keymap)))
          (define-key map (kbd "g") 'ggtags-grep)
          (define-key map (kbd "s") 'ggtags-find-other-symbol)
          (define-key map (kbd "h") 'ggtags-view-tag-history)
          (define-key map (kbd "u") 'ggtags-find-reference)
          (define-key map (kbd "f") 'ggtags-find-file)
          (define-key map (kbd "c") 'ggtags-create-tags)
          (define-key map (kbd "u") 'ggtags-update-tags)
          map)))

;; magit
(global-set-key (kbd "C-c g") 'magit-status)

;; omnisharp
(with-eval-after-load 'omnisharp
  (defvar omnisharp-command-map
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "u") 'omnisharp-helm-find-usages)
      (define-key map (kbd "r") 'omnisharp-rename)
      (define-key map (kbd "d") 'omnisharp-go-to-definition)
      (define-key map (kbd "e") 'omnisharp-go-to-definition-other-window)
      map)
    "Keymap for omnisharp commands.")
  (fset 'omnisharp-command-map omnisharp-command-map)
  (define-key omnisharp-mode-map (kbd "C-c o") 'omnisharp-command-map)
  (define-key omnisharp-mode-map (kbd "M-.") 'omnisharp-go-to-definition)
  (define-key omnisharp-mode-map (kbd "M-/") 'omnisharp-find-usages)
  )

;; projectile
(define-key projectile-command-map (kbd "a") #'helm-projectile-ag)
(define-key projectile-command-map (kbd "s g") nil)
(define-key projectile-command-map (kbd "s a") nil)
(define-key projectile-command-map (kbd "s s") nil)
