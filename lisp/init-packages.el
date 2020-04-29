;; create date: 2020-04-28
;; author : muxi_k

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar muxi_k/packages '(
		      ;; --- Auto-completion ---
		      company
		      ;; --- Better Editor ---
		      hungry-delete
		      swiper
		      counsel
		      smartparens
		      popwin
		      
		      neotree
		      all-the-icons
		      ;; --- Major Mode ---
		      js2-mode
		      ;; --- Minor Mode ---
		      nodejs-repl
		      exec-path-from-shell
		      ;; --- Themes ---
		      monokai-theme
		      dracula-theme
		      ;; solarized-theme
		      ) "Default packages")

(setq package-selected-packages muxi_k/packages)

(defun muxi_k/packages-installed-p ()
  (loop for pkg in muxi_k/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (muxi_k/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg muxi_k/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;; - - - - - - - - - - - - -

;; start global-company
(global-company-mode t)

;; load theme
(load-theme 'dracula t)

;; popwin
(require 'popwin)
(popwin-mode t)

;; hungry delete
(global-hungry-delete-mode t)

;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; config js2-mode for javascript file
(setq auto-mode-alist (append'(("\\.js\\'". js2-mode)) auto-mode-alist))

;; smartparens
(add-hook 'js-mode-hook #'smartparens-mode)
(smartparens-global-mode t)

;; neotree
(add-to-list 'load-path "/some/path/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; icons
(require 'all-the-icons)

(provide 'init-packages)
