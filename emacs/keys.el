(setq mac-option-key-is-meta nil)
(setq mac-option-modifier nil)

;; Cursor
(global-set-key (kbd "ß") 'backward-word) ;; M-b
(global-set-key (kbd "ƒ") 'forward-to-word) ;; M-f
(global-set-key (kbd "<next>") 'scroll-up-max)
(global-set-key (kbd "<prior>") 'scroll-down-min)
;;(global-set-key (kbd "C-c <prior>") 'beginning-of-buffer) 
;;(global-set-key (kbd "C-c <next>") 'end-of-buffer)

;; Edition
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-c z") 'redo)
(global-set-key (kbd "‹") 'kill-ring-save) ;; M-w
(global-set-key (kbd "∂") 'duplicate-current-line-or-region) ;; M-d
(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-c k") 'kill-line)
(global-set-key (kbd "∏") 'move-line-up) ;; M-S-p
(global-set-key (kbd "ı") 'move-line-down) ;; M-S-n

;; Commands
(global-set-key (kbd "≈") 'helm-M-x) ;; M-x
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "Ú") 'helm-show-kill-ring) ;; M-y
(global-set-key (kbd " ") 'er/expand-region) ;; M-SPC

;;(global-set-key (kbd "C-n") 'new-empty-buffer) 
;;(global-set-key (kbd "<TAB>") 'ac-complete-with-helm)
;;(global-set-key (kbd "C-c C-s") 'sr-speedbar-toggle)
