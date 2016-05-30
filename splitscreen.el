;;;; splitscreen.el - Tmux-like bindings for managing windows and buffers.
;; URL: https://github.com/mattduck/splitscreen

(require 'evil)
(require 'elscreen)

;; Splitscreen mode will just provide a keymap.
(defvar ss-mode-map (make-sparse-keymap))
(define-prefix-command 'ss-prefix)
(define-key ss-mode-map (kbd "C-w") 'ss-prefix)

;; We override these. Just declare them as part of the splitscreen map, not
;; evil-window-map.
(define-key evil-window-map (kbd "n") nil)
(define-key evil-window-map (kbd "p") nil)
(define-key evil-window-map (kbd "c") nil)
(define-key evil-window-map (kbd "C-h") nil)
(define-key evil-window-map (kbd "C-j") nil)
(define-key evil-window-map (kbd "C-k") nil)
(define-key evil-window-map (kbd "C-l") nil)
(define-key evil-window-map (kbd "C-l") nil)

(define-key ss-prefix (kbd "h") 'evil-window-left)
(define-key ss-prefix (kbd "j") 'evil-window-down)
(define-key ss-prefix (kbd "k") 'evil-window-up)
(define-key ss-prefix (kbd "l") 'evil-window-right)

(define-key ss-prefix (kbd "c") 'elscreen-create)
(define-key ss-prefix (kbd "n") 'elscreen-next)
(define-key ss-prefix (kbd "p") 'elscreen-previous)
(define-key ss-prefix (kbd "X") 'elscreen-kill)
(define-key ss-prefix (kbd "%") 'split-window-right)
(define-key ss-prefix (kbd "\"") 'split-window-below)
(define-key ss-prefix (kbd "x") 'delete-window)
(define-key ss-prefix (kbd "z") 'delete-other-windows)
(define-key ss-prefix (kbd "C-h") 'evil-window-decrease-width)
(define-key ss-prefix (kbd "C-j") 'evil-window-decrease-height)
(define-key ss-prefix (kbd "C-k") 'evil-window-increase-height)
(define-key ss-prefix (kbd "C-l") 'evil-window-increase-width)
(define-key ss-prefix (kbd "SPC") 'balance-windows)
(define-key ss-prefix (kbd "0") '(lambda() (interactive) (elscreen-goto 0)))
(define-key ss-prefix (kbd "1") '(lambda() (interactive) (elscreen-goto 1)))
(define-key ss-prefix (kbd "2") '(lambda() (interactive) (elscreen-goto 2)))
(define-key ss-prefix (kbd "3") '(lambda() (interactive) (elscreen-goto 3)))
(define-key ss-prefix (kbd "4") '(lambda() (interactive) (elscreen-goto 4)))
(define-key ss-prefix (kbd "5") '(lambda() (interactive) (elscreen-goto 5)))
(define-key ss-prefix (kbd "6") '(lambda() (interactive) (elscreen-goto 6)))
(define-key ss-prefix (kbd "7") '(lambda() (interactive) (elscreen-goto 7)))
(define-key ss-prefix (kbd "8") '(lambda() (interactive) (elscreen-goto 8)))
(define-key ss-prefix (kbd "9") '(lambda() (interactive) (elscreen-goto 9)))

(define-minor-mode splitscreen-mode
    "Provides tmux-like bindings for managing windows and buffers. 
     See https://github.com/mattduck/splitscreen"
    1 ; enable by default
    :lighter " Split"
    :global 1
    :keymap ss-mode-map)

(elscreen-start)

(provide 'splitscreen)
