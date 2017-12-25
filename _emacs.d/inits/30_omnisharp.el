(require 'omnisharp)

(setq omnisharp-server-executable-path
      (concat (getenv "HOME") "/Sources/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe"))

(add-hook 'csharp-mode-hook '(lambda () (omnisharp-mode)))
