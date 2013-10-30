;;;; splitscreen.el - Tmux-like bindings for managing windows and buffers.
;; URL: https://github.com/mattduck/splitscreen

(require 'evil)

;; Splitscreen mode will just provide a keymap.
(defvar ss-mode-map (make-sparse-keymap))
(define-prefix-command 'ss-prefix)
(define-key ss-mode-map (kbd "C-w") 'ss-prefix)

(define-key evil-window-map (kbd "n") nil)
(define-key ss-prefix (kbd "n") 'next-buffer)
(define-key evil-window-map (kbd "p") nil)
(define-key ss-prefix (kbd "p") 'previous-buffer)

(define-key ss-prefix (kbd "%") 'split-window-right)
(define-key ss-prefix (kbd "\"") 'split-window-below)
(define-key ss-prefix (kbd "x") 'delete-window)
(define-key ss-prefix (kbd "z") 'delete-other-windows)
(define-key evil-window-map (kbd "C-h") nil)
(define-key ss-prefix (kbd "C-h") 'evil-window-decrease-width)
(define-key evil-window-map (kbd "C-j") nil)
(define-key ss-prefix (kbd "C-j") 'evil-window-decrease-height)
(define-key evil-window-map (kbd "C-k") nil)
(define-key ss-prefix (kbd "C-k") 'evil-window-increase-height)
(define-key evil-window-map (kbd "C-l") nil)
(define-key ss-prefix (kbd "C-l") 'evil-window-increase-width)
(define-key ss-prefix (kbd "SPC") 'balance-windows)

(define-minor-mode splitscreen-mode
    "Provides tmux-like bindings for managing windows and buffers. 
     See https://github.com/mattduck/splitscreen"
    1 ; enable by default
    :lighter " Split"
    :global 1
    :keymap ss-mode-map)

(provide 'splitscreen-mode)
