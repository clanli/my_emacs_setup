;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------


;; Installera följande på hosten
;; # apt install flake8 python-pip elpa-py-autopep8 python-autopep8
;; # pip install jedi
(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(elpy-enable)

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves/"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;; auto close bracket insertion. New in emacs 24
(electric-pair-mode 1)

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
;;(load-theme 'deeper-blue t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
 (setq mouse-wheel-progressive-speed nil)

(require 'elpy)
(elpy-enable)
;;(elpy-use-ipython)

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (material-theme dired-sidebar django-manage django-snippets django-mode py-autopep8 yaml-mode timonier kubernetes-tramp kubernetes json-mode flycheck evil elpy ein better-shell better-defaults bash-completion))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
