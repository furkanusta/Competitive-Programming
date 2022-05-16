(require 'util)
(in-package :my-aoc)

(defvar data (mapcar #'parse-integer (str:split "," (car (read-file "7.inp")))))

(defun distance (num1 num2)
  (let* ((dist (abs (- num1 num2)))
         (dist-p1 (1+ dist)))
    (/ (* dist dist-p1) 2)))

;; I feel like one can derive a formula for this and take a derivative to find minimum point but
;; this works and good enough.
(let* ((min-point (reduce #'min data))
       (max-point (reduce #'max data))
       (len (- max-point min-point)))
  (reduce #'min
          (mapcar
           (lambda (center)
             (reduce #'+ (mapcar (curry #'distance center) data)))
           (iota len :start min-point))))
