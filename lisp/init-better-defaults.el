;; create time : 2020-4-28
;; author: muxi_k

;; Disable the sound of Didi on Windows
(setq ring-bell-function 'ignore)

;; auto revert
(global-auto-revert-mode t)

;; show linum-mode
(global-linum-mode t)

;; disable auto-save
(setq auto-save-default nil)

;; inhibit splash screen
(setq inhibit-splash-screen t)

;; disable file backup
(setq make-backup-files nil)

;; Recently opened files   
(require 'recentf)

;; turn on recentf 
(recentf-mode 1)

;; set max menu items
(setq  recentf-max-menu-items 25)

;; delete slecttion
(delete-selection-mode t)

;; abbrev
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(("mm" "muxi_k")))

;; el mode show paren highlight
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; code indent
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))


;; provide
(provide 'init-better-defaults)
