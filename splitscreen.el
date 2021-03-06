;;;; splitscreen.el - Tmux-like bindings for managing windows and buffers.
;; URL: https://github.com/mattduck/splitscreen

(require 'evil)
(require 'eyebrowse)

(defvar splitscreen/zoomed-p nil)
(defun splitscreen/toggle-zoom ()
  "Toggle buffer maximising within this eyebrowse tab. Replicates the
   tmux zoom feature."
  (interactive)
  (if (= 1 (length (window-list)))
      (when (and (get-register (eyebrowse--get 'current-slot))
                 splitscreen/zoomed-p)
        (progn
          (setq-local splitscreen/zoomed-p nil)
          (jump-to-register (eyebrowse--get 'current-slot))))
    (progn
      (window-configuration-to-register (eyebrowse--get 'current-slot))
      (setq-local splitscreen/zoomed-p t)
      (delete-other-windows))))

(defun splitscreen/reset-zoom (fn &rest args)
  (apply fn args)
  (set-register (eyebrowse--get 'current-slot) nil))

(advice-add 'eyebrowse-close-window-config :around 'splitscreen/reset-zoom '((name . "splitscreen")))

(defun splitscreen/elscreen-create ()
  "Elscreen-create on the current buffer. I prefer this to starting
   windows in the scratch buffer, because that takes some commands
   outside the current project (eg. project-file-file)"
  (interactive)
  (let ((elscreen-default-buffer-name (buffer-name)))
    (elscreen-create)))

(defun splitscreen/window-left ()
  (interactive)
  (evil-window-left 1))

(defun splitscreen/window-right ()
  (interactive)
  (evil-window-right 1))

(defun splitscreen/window-up ()
  (interactive)
  (evil-window-up 1))

(defun splitscreen/window-down ()
  (interactive)
  (evil-window-down 1))

(defun splitscreen/increase-width () (interactive) (evil-window-increase-width 10))
(defun splitscreen/decrease-width () (interactive) (evil-window-decrease-width 10))
(defun splitscreen/increase-height () (interactive) (evil-window-increase-height 10))
(defun splitscreen/decrease-height () (interactive) (evil-window-decrease-height 10))

(defvar splitscreen/mode-map (make-sparse-keymap))
(define-prefix-command 'splitscreen/prefix)
(define-key splitscreen/mode-map (kbd "C-w") 'splitscreen/prefix)

;; We override these. Just declare them as part of the splitscreen map, not
;; evil-window-map.
(define-key evil-window-map (kbd "h") nil)
(define-key evil-window-map (kbd "j") nil)
(define-key evil-window-map (kbd "k") nil)
(define-key evil-window-map (kbd "l") nil)
(define-key evil-window-map (kbd "n") nil)
(define-key evil-window-map (kbd "p") nil)
(define-key evil-window-map (kbd "c") nil)
(define-key evil-window-map (kbd "C-h") nil)
(define-key evil-window-map (kbd "C-j") nil)
(define-key evil-window-map (kbd "C-k") nil)
(define-key evil-window-map (kbd "C-l") nil)
(define-key evil-window-map (kbd "C-l") nil)
(define-key evil-window-map (kbd "o") nil)

(define-key splitscreen/prefix (kbd "h") 'splitscreen/window-left)
(define-key splitscreen/prefix (kbd "j") 'splitscreen/window-down)
(define-key splitscreen/prefix (kbd "k") 'splitscreen/window-up)
(define-key splitscreen/prefix (kbd "l") 'splitscreen/window-right)

(define-key splitscreen/prefix (kbd "c") 'eyebrowse-create-window-config)
(define-key splitscreen/prefix (kbd "n") 'eyebrowse-next-window-config)
(define-key splitscreen/prefix (kbd "p") 'eyebrowse-prev-window-config)
(define-key splitscreen/prefix (kbd "X") 'eyebrowse-close-window-config)
(define-key splitscreen/prefix (kbd "%") 'split-window-right)
(define-key splitscreen/prefix (kbd "\"") 'split-window-below)
(define-key splitscreen/prefix (kbd "x") 'delete-window)
(define-key splitscreen/prefix (kbd "z") 'splitscreen/toggle-zoom)
(define-key splitscreen/prefix (kbd "o") 'splitscreen/toggle-zoom)  ;; This is easier to reach than z
(define-key splitscreen/prefix (kbd "C-h") 'splitscreen/decrease-width)
(define-key splitscreen/prefix (kbd "C-j") 'splitscreen/decrease-height)
(define-key splitscreen/prefix (kbd "C-k") 'splitscreen/increase-height)
(define-key splitscreen/prefix (kbd "C-l") 'splitscreen/increase-width)
(define-key splitscreen/prefix (kbd "SPC") 'balance-windows)
(define-key splitscreen/prefix (kbd "0") 'eyebrowse-switch-to-window-config-0)
(define-key splitscreen/prefix (kbd "1") 'eyebrowse-switch-to-window-config-1)
(define-key splitscreen/prefix (kbd "2") 'eyebrowse-switch-to-window-config-2)
(define-key splitscreen/prefix (kbd "3") 'eyebrowse-switch-to-window-config-3)
(define-key splitscreen/prefix (kbd "4") 'eyebrowse-switch-to-window-config-4)
(define-key splitscreen/prefix (kbd "5") 'eyebrowse-switch-to-window-config-5)
(define-key splitscreen/prefix (kbd "6") 'eyebrowse-switch-to-window-config-6)
(define-key splitscreen/prefix (kbd "7") 'eyebrowse-switch-to-window-config-7)
(define-key splitscreen/prefix (kbd "8") 'eyebrowse-switch-to-window-config-8)
(define-key splitscreen/prefix (kbd "9") 'eyebrowse-switch-to-window-config-9)

(define-minor-mode splitscreen-mode
    "Provides tmux-like bindings for managing windows and buffers.
     See https://github.com/mattduck/splitscreen"
    1 ; enable by default
    :lighter " Split"
    :global 1
    :keymap splitscreen/mode-map)

(eyebrowse-mode)

(provide 'splitscreen)
