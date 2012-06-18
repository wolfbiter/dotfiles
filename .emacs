(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(initial-scratch-message "\"Ride\"")
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "White" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "Liberation Mono"))))
 '(blue ((t (:foreground "#0099FF"))))
 '(comint-highlight-prompt ((((min-colors 88)) (:foreground "IndianRed"))))
 '(font-lock-doc-face ((t (:foreground "#223953")))))



;;; Shell mode edits
(setq comint-process-echoes t) ; stop echoes
;(setq ansi-color-names-vector ; better contrast colors
;      ["black" "red4" "green4" "yellow4"
;       "blue3" "magenta4" "cyan4" "white"])
;(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
;(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(setq comint-prompt-read-only t)
(setenv "PS1" "\\e[0;32m◆\\u@\\H \\D{%Y-%m-%d} \\t\\e[0;30m\\n")

;; clojure-mode
(add-to-list 'load-path "~/opt/clojure-mode")
(require 'clojure-mode)

;; Edit keybindings
(global-unset-key (kbd "C-x C-o"))
(global-set-key (kbd "C-x C-o") 'other-window)
(global-set-key (kbd "C-x g") 'goto-line)
(global-set-key (kbd "<delete>") 'delete-char)
(global-unset-key (kbd "C-x C-v"))
(global-unset-key (kbd "C-x C-c"))
(global-unset-key (kbd "C-x C-x"))
(global-unset-key (kbd "C-v"))
(global-set-key (kbd "C-x c") 'clipboard-kill-ring-save) ;;copy
(global-set-key (kbd "C-x C-c") 'clipboard-kill-ring-save) ;;copy
(global-set-key (kbd "C-x v") 'clipboard-yank) ;;paste
(global-set-key (kbd "C-x C-v") 'clipboard-yank) ;;paste
(global-set-key (kbd "C-x x") 'clipboard-kill-region) ;;cut
(global-set-key (kbd "C-x C-x") 'clipboard-kill-region) ;;cut
(global-unset-key (kbd "C-d"))
(global-set-key (kbd "C-d") 'kill-whole-line)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-c f") 'isearch-backward)


(global-unset-key (kbd "C-x f"))
(global-set-key (kbd "C-x f") 'find-file)
(global-unset-key (kbd "C-s"))
(global-set-key (kbd "C-s") 'query-replace)
(global-unset-key (kbd "C-x s"))
(global-set-key (kbd "C-x s") 'replace-string)
(global-unset-key (kbd "C-a"))
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-unset-key (kbd "C-x a"))
(global-set-key (kbd "C-c c") 'clojure-jack-in)


(global-unset-key (kbd "C-x a"))
(defun jao-copy-line ()
  "Copy current line in the kill ring"
  (interactive)
  (kill-ring-save (line-beginning-position) 
		  (line-beginning-position 2))`
  (kill-ring-save (line-beginning-position) 
		  (line-beginning-position 2))
  (message "Line copied"))
(global-set-key (kbd "C-x a") 'jao-copy-line)


;; properly indents lines after a paste
(defadvice yank (after indent-region activate)
  (indent-region (region-beginning) (region-end) nil))



;; Change paren-match highlight color
(require 'paren)
(set-face-background 'show-paren-match-face "#009933")
(set-face-foreground 'show-paren-match-face "#FFFFFF")
(set-face-attribute 'show-paren-match-face nil :weight 'extra-bold)


;; rainbow delimiters
(add-to-list 'load-path "~/opt/rainbow-delimiters")
(require 'rainbow-delimiters)
(require 'make-bright)

;; Clojure Colour Scheme
(add-to-list 'load-path "~/opt/my-color-themes")
(require 'color-theme-arjen)

;; blinking colorful cursor
(require 'colorcursor)


;; Maximize Window on startup
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)



;; linum-mode
(global-linum-mode 1)
(global-hl-line-mode 1) ;; highlight line of the cursor
(set-face-background 'hl-line "#492754")


;; desktop save mode
;;(desktop-save-mode 1)


;; Startup functions
(run-with-idle-timer 0.1 nil 'toggle-fullscreen)
;(add-hook 'clojure-mode-hook '(lambda () (setq frame-background-mode 'light)))
(color-theme-arjen)
(add-hook 'emacs-startup-hook 'global-visual-line-mode)
(add-hook 'emacs-startup-hook 'shell)