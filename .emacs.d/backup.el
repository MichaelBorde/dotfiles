(defvar backup-directory (concat user-emacs-directory "backups/"))

(if (not (file-exists-p backup-directory))
    (make-directory backup-directory t))

(setq backup-directory-alist `((".*" . ,backup-directory)))
(setq auto-save-file-name-transforms `((".*" ,backup-directory t)))

(setq make-backup-files t
      backup-by-copying t
      version-control t
      delete-old-versions t
      delete-by-moving-to-trash t
      kept-old-versions 6
      kept-new-versions 9
      auto-save-default t
      auto-save-timeout 20
      auto-save-interval 200)
