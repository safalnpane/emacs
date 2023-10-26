;; Awesome Emacs Config starts here
;; Author: Safal Neupane
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; start with Melpa setup
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))


;; Gruvbox theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruvbox-dark-soft))
 '(custom-safe-themes
   '("871b064b53235facde040f6bdfa28d03d9f4b966d8ce28fb1725313731a2bcc8" "2ff9ac386eac4dffd77a33e93b0c8236bb376c5a5df62e36d4bfa821d56e4e20" "72ed8b6bffe0bfa8d097810649fd57d2b598deef47c992920aef8b5d9599eefe" "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" default))
 '(ispell-dictionary nil)
 '(package-selected-packages '(blacken py-autopep8 blamer magit smex gruvbox-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Font is always Hack
(set-frame-font "Hack Nerd Font-15")

;; Whitespace rendering
(setq-default whitespace-display-mappings
      '(
        ;; space -> · else .
        (space-mark 32 [183] [46])
        ;; new line -> ¬ else $
        (newline-mark ?\n [10550 ?\n] [36 ?\n])
        ;; carriage return (Windows) -> ¶ else #
        (newline-mark ?\r [182] [35])
        ;; tabs -> » else >
        (tab-mark ?\t [187 ?\t] [62 ?\t])))

;; Don't enable whitespace for.
(setq-default whitespace-global-modes
              '(not shell-mode
                    help-mode
                    magit-mode
                    magit-diff-mode
                    ibuffer-mode
                    dired-mode
                    occur-mode))

;; Enable whitespace mode
(global-whitespace-mode t)

;; disable those bars. Nobody needs them
(menu-bar-mode 0)
(tool-bar-mode 0)

;; Also, blank startup screen
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

;; don't make backup file please.
(setq make-backup-file nil)

;; highlight current line
(global-hl-line-mode 1)

;; colum number
(setq column-number-mode t)


;; Ido
(ido-mode t)

;; disable scrollbar
(scroll-bar-mode -1)

;; Some, finger-saving key-bindings
;; --------------------------------------

;; Find files with M-f
(global-set-key (kbd "M-f") 'ido-find-file)

;; Find file into other window
(global-set-key (kbd "M-F") 'ido-find-file-other-window)

;; switch buffer in current window
(global-set-key (kbd "M-s") 'switch-to-buffer)

;; switch buffer in other window
(global-set-key (kbd "M-S") 'switch-to-buffer-other-window)

;; save file in the current window
(global-set-key (kbd "M-w") 'save-buffer)

;; split right
(global-set-key (kbd "C-%") 'split-window-right)

;; split below
(global-set-key (kbd "C-\"") 'split-window-below)

;; Copy and paste
(global-set-key (kbd "C-c") 'copy-region-as-kill)
(global-set-key (kbd "C-v") 'yank)


;; Python stuff
;;-------------------------------------------
(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  )
(elpy-enable)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  )

;; When Emacs starts
;;-------------------------------------------
;; cd into the software
(cd "~/software")

;; Split the window please.
(split-window-right)

(provide '.emacs)
;;; .emacs ends here
