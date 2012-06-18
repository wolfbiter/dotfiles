(require 'rainbow-delimiters)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'slime-repl-mode-hook 'rainbow-delimiters-mode)
(let ((depth 0))
  (dolist (color
           ;; These are nicked from VIMClojure:
           ;; vimclojure/vim/syntax/clojure.vim
           '("orange1"
             "yellow1"
             "greenyellow"
             "green1"
             "springgreen1"
             "cyan1"
             "slateblue1"
             "magenta1"
             "purple1"))
    (set-face-foreground (intern (format "rainbow-delimiters-depth-%d-face"
                                         (incf depth)))
                         color)))
(provide 'make-bright)
