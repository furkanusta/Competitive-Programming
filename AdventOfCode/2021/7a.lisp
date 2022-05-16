(require 'util)
(in-package :my-aoc)

(defvar data (mapcar #'parse-integer (str:split "," (car (read-file "7.inp")))))

(apply
 #'min
 (mapcar
  (lambda (num1)
    (reduce #'+ (mapcar (lambda (num2) (abs (- num1 num2))) data) :initial-value 0))
  data))
