;; settings
(setq speedbar-directory-unshown-regexp "^$")
(setq speedbar-show-unknown-files t)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-skip-other-window-p t)

;; keys
(global-set-key (kbd "C-c b") 'sr-speedbar-toggle)
(global-set-key (kbd "C-c C-b") 'sr-speedbar-select-window)
