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
(global-set-key (kbd "M-P") 'move-text-up)
(global-set-key (kbd "M-N") 'move-text-down)
(global-set-key (kbd "C-c TAB") 'indent-buffer)

;; Commands
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-SPC") 'er/expand-region)

