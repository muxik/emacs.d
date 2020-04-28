;; my emacs config

;; requires
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-packages)
(require 'init-ui)

;; disable auto-save
(setq auto-save-default nil)

;; auto revert
(global-auto-revert-mode t)

;; inhibit splash screen
(setq inhibit-splash-screen t)

;; open my init.el file 
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>c") 'open-my-init-file)

;; disable file backup
(setq make-backup-files nil)

;; Recently opened files   
(require 'recentf)

;; turn on recentf 
(recentf-mode 1)

;; set max menu items
(setq  recentf-max-menu-items 25)

;; set global key 
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; delete slecttion
(delete-selection-mode t)

;; set emacs full screen
(setq initial-frame-alist (quote ((fullscreen . maximizd))))

;; el mode show paren highlight
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; hungry delete
(global-hungry-delete-mode t)

;; Smex is a M-x enhancement for Emacs
;; (require 'smex) 
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)

;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-varible)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; smartparens
(add-hook 'js-mode-hook #'smartparens-mode)
(smartparens-global-mode t)


;; config js2-mode for javascript file
(setq auto-mode-alist (append'(("\\.js\\'". js2-mode)) auto-mode-alist))

;; Run Nodejs REPL in emacs
(require 'nodejs-repl)



;; abbrev
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					     ("mm" "muxi_k")
					     ))


;; --- --- --- end --- --- ---

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.05)
 '(company-minimum-prefix-length 1)
 '(custom-safep-themes
   (quote
    ("a41b81af6336bd822137d4341f7e16495a49b06c180d6a6417bf9fd1001b6d2b" "f9aede508e587fe21bcfc0a85e1ec7d27312d9587e686a6f5afdbb0d220eab50" default)))
 '(package-selected-packages (quote (company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "dim gray")))))
