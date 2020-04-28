;; create date: 2020-4-28
;; author: muxi_k


;; set font famliy and font size  
(set-default-font "IBM Plex Mono Text-15")

;; set cursor type
(setq-default cursor-type 'bar)

;; turn off tool-bar
(tool-bar-mode -1)

;; turn off scroll-bar
(scroll-bar-mode -1)

;; show linum-mode
(global-linum-mode t)

;; Highlight active line
(global-hl-line-mode)

;; provide
(provide 'init-ui)
