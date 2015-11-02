(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)

;; Cursor
(global-set-key (kbd "M-f") 'forward-to-word)
(global-set-key (kbd "<next>") 'scroll-up-max)
(global-set-key (kbd "<prior>") 'scroll-down-min)

;; Edition
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-c z") 'redo)
(global-set-key (kbd "M-d") 'duplicate-current-line-or-region)
(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-c k") 'kill-line)
(global-set-key (kbd "M-P") 'move-line-up)
(global-set-key (kbd "M-N") 'move-line-down)

;; Commands
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z")  'helm-select-action)
(global-set-key (kbd "M-SPC") 'er/expand-region)
(global-set-key (kbd "C-c C-s") 'sr-speedbar-toggle)

