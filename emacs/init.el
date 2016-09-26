(menu-bar-mode -1)
(global-linum-mode 1)

(setq-default c-basic-offset 4)
(setq c-default-style "linux"
      c-basic-offset 4
      indent-tabs-mode t)

; list the packages you want
(setq package-list '(helm company neotree))
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)
; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))
; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


(ido-mode 1)
(setq ido-separator "\n")





(setq neo-smart-open t)
(neotree-toggle)
;(global-set-key (kdb "<f9>") 'neotree-toggle)

;;company-mode
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)
(global-set-key (kbd "C-l") 'company-complete)

;;helm key bind
(global-set-key (kbd "M-x") 'helm-M-x)
;;temp file
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
            `((".*" ,temporary-file-directory t)))



;; compile configure
(defun my-compile ()
  "Run compile and resize the compile window"
  (interactive)
  (progn
    (call-interactively 'compile)
    (setq cur (selected-window))
    (setq w (get-buffer-window "*compilation*"))
    (select-window w)
    (setq h (window-height w))
    (shrink-window (- h 10))
    (select-window cur)
    )
      )

(setq split-height-threshold nil)
(setq split-height-threshold nil)



(defun my-compilation-hook ()
  (when (not (get-buffer-window "*compilation*"))
    (save-selected-window
      (save-excursion
	(let* ((w (split-window-vertically))
	       (h (window-height w)))
	  (select-window w)
	  (switch-to-buffer "*compilation*")
	  (shrink-window (- h compilation-window-height)))))))
;(add-hook 'compilation-mode-hook 'my-compilation-hook)

(show-paren-mode t)

(electric-pair-mode)

(global-set-key (kbd "<f5>") (quote my-compile))

(add-hook 'scheme-mode-hook
	  (lambda ()
	    (set (make-local-variable 'compile-command)
		 (concat "scheme --script " buffer-file-name))))

(add-hook 'python-mode-hook
	  (lambda ()
	    (set (make-local-variable 'compile-command)
		 (concat "python " buffer-file-name))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
