;;
;; abbrev
;;---

;; NOTE: 脳死で入れてたけど不要説。一旦コメントアウトして様子見
;; (setq abbrev-mode nil)
;; (setq default-abbrev-mode nil)
;; (setq dabbrev-case-fold-search nil)

;;
;; dired
;;---

;; (setq dired-listing-switches "-AFl --group-directories-first")
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

;;
;; vc
;;---

(setq vc-follow-symlinks nil)

;;
;; uniquify
;;---

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;
;; electric-pair-mode
;;---

;; NOTE: smartparens と競合するので使わない
;; (electric-pair-mode t)

;;
;; smartparens
;;---

(require 'smartparens-config)
(smartparens-global-mode t)

;;
;; flycheck
;;---

(require 'flycheck)

(add-hook 'after-init-hook #'global-flycheck-mode)

(flycheck-add-mode 'javascript-eslint 'typescript-mode)

(with-eval-after-load 'flycheck
  (setq flycheck-disabled-checkers '(javascript-jshint javascript-jscs))
  (setq flycheck-display-errors-function #'flycheck-display-error-messages)
  (setq flycheck-display-errors-function 0.5)
  (flycheck-pos-tip-mode))

;;
;; Prettier
;;---

(require 'prettier-js)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode-hook 'prettier-js-mode)

;;
;; emmet-mode
;;---

(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2)))

;;
;; helm
;;---

(require 'helm)
(require 'helm-config)

(helm-mode 1)

(setq helm-mode-fuzzy-match t)
(setq helm-split-window-default-side 'other)

(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))

(defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
  "Execute command only if CANDIDATE exists"
  (when (file-exists-p candidate)
    ad-do-it))

;;
;; EditorConfig
;;---

(editorconfig-mode 1)
(setq edconf-exec-path "/usr/local/bin/editorconfig")

;;
;; yasnippet
;;---

(require 'yasnippet)

(setq yas-snippet-dirs
      '(
        "~/.emacs.d/snippets"
        "~/.yasnippet"
        ))

(yas-global-mode 1)

;; 
;; company-mode
;;---

(setq company-idle-delay .3)
(setq company-echo-delay .3)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)

(with-eval-after-load 'company-dabbrev-code
  (setq company-dabbrev-code-other-buffers nil))

(with-eval-after-load 'company-gtags
  (setq company-gtags-insert-arguments nil))

(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'php-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 '((
                    company-yasnippet
                    :with
                    company-gtags
                    ;; company-ac-php-backend
                    company-dabbrev-code
                    )))
            (setq company-transformers '(company-sort-by-backend-importance))
            ))

(add-hook 'csharp-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 '((
                    company-yasnippet
                    :with
                    company-omnisharp
                    )))
            (setq company-transformers '(company-sort-by-backend-importance))
            ))

;;
;; projectile
;;---

(projectile-global-mode)

(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; (setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

;; (setq projectile-git-command "ag -nocolor -l -0")

(setq projectile-switch-project-action 'projectile-dired)

;;
;; recentf-ext
;;---

(setq recentf-max-saved-items 2000)
(setq recentf-auto-cleanup 10)
(setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
(recentf-mode 1)

;;
;; exec-path-from-shell
;;---

(exec-path-from-shell-initialize)

;;
;; hlinum
;;---

(hlinum-activate)
