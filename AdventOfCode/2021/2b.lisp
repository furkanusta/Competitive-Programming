(use-package :str)
(use-package :iterate)

(require 'util)

(defvar data (read-file "2.inp"))

(defvar depth 0)
(defvar aim 0)
(defvar pos 0)

(dolist (line data)
  (let* ((movement (words line))
         (direction (car movement))
         (amount (parse-integer (cadr movement))))
    (if (string-equal direction "forward")
        (progn
          (incf pos amount)
          (incf depth (* amount aim)))
        (if (string-equal direction "up")
            (decf aim amount)
            (incf aim amount)))))

(print (* depth pos))
