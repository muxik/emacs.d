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
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

;; hidden windows eol
(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\^M []))

;; remove windows eol
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))


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

;; hippie-expand
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))
;; no yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; recursive delete and recursive copies
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; Let Emacs reuse the only buffer as a dedicated buffer for Dired Mode display.
(put 'dired-find-alternate-file 'disabled nil)

;; Active Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; When there are two split screens in one window, the other split screen is automatically set as the destination of the copy address.
(setq dired-dwin-target 1) 

;; config for popwin
(setq split-width-threshold t)

;; Default search for the string currently selected or under the cursor
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'occur-dwim)

;; provide
(provide 'init-better-defaults)
