;; Disable the tool bar
(tool-bar-mode -1)

;; Set the frame size
(when window-system
  (set-frame-size (selected-frame) 110 58)
  (set-frame-position (selected-frame) 760 0)
  )

;; Set the frame font
(when (window-system)
  (set-frame-font "Fira Code 14"))
