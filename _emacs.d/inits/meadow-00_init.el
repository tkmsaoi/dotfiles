(require 'un-define) ; require mule-ucs
(require 'jisx0213)
(set-language-environment "Japanese")

(mw32-ime-initialize)
(setq default-input-method "MW32-IME")
(setq-default mw32-ime-mode-line-state-indicator "[--]")
(setq mw32-ime-mode-line-state-indicator-list '("[--]" "[Ç†]" "[--]"))
(add-hook 'mw32-ime-on-hook
          (function (lambda () (set-cursor-height 2))))
(add-hook 'mw32-ime-off-hook
          (function (lambda () (set-cursor-height 4))))

;; (set-cursor-type 'box)
;; (set-cursor-type 'hairline-caret)

(setq w32-hide-mouse-on-key t)
(setq w32-hide-mouse-timeout 5000)

(set-message-beep 'silent)

(setq explicit-shell-file-name "cmdproxy.exe")
(setq shell-file-name "cmdproxy.exe")
(add-hook 'shell-mode-hook
          (lambda ()
            (set-buffer-process-coding-system 'sjis-unix 'sjis-unix)))


(require 'mw32script)
(mw32script-init)

(create-fontset-from-request 
 "Consolas"
 '((width . 7)
   (height . 14)
   (weight . 50)
   (fixed . t)
   (italic . nil))
 '((family . "Consolas")
   (family . "ÇlÇrÅ@ÉSÉVÉbÉN")))

(add-to-list 'default-frame-alist '(font . "Consolas"))
