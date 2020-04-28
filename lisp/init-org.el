;; crate time : 2020-4-28
;; author : muxi_k

(require 'org)

(setq org-src-fontify-natively t)
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)
