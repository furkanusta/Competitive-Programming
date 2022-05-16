(require 'util)
(in-package :my-aoc)

(defvar data (mapcar (lambda (line) (mapcar #'str:words (str:split "|" line))) (read-file "8.inp")))

(defun solve-one (outputs)
  (let* ((lengths (mapcar #'length outputs)))
    (count-if (lambda (length) (member length '(2 3 4 7))) lengths)))

(reduce #'+ (mapcar #'solve-one (mapcar #'cadr data)))
