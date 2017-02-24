
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/.emacs.d/packages.el")

(load "~/.emacs.d/settings.el")
(load "~/.emacs.d/keys.el")
(load "~/.emacs.d/backup.el")
(load "~/.emacs.d/files.el")
(load "~/.emacs.d/helm.el")
(load "~/.emacs.d/speedbar.el")
(load "~/.emacs.d/functions.el")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
