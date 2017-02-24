(defun scroll-up-max () 
  (interactive)
  (condition-case nil (scroll-up)))

(defun duplicate-current-line-or-region (arg)
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
	(exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
	(exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
	(goto-char end)
	(newline)
	(insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))

(defun indent-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

(defun zsh ()
  (interactive)
  (ansi-term "/bin/zsh" "zsh"))
