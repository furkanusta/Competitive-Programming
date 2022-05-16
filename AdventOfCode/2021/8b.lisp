(require 'util)
(in-package :my-aoc)

(defvar data (mapcar (lambda (line) (mapcar #'str:words (str:split "|" line))) (read-file "8.inp")))

(defun digits-with-length (digits len)
  (mapcar (rcurry #'coerce 'list)
          (remove-if-not (lambda (digit) (= (length digit) len)) digits)))

(defvar seven-segment-positions
  '((0 1 2 4 5 6)
    (2 5)
    (0 2 3 4 6)
    (0 2 3 5 6)
    (1 2 3 5)
    (0 1 3 5 6)
    (0 1 3 4 5 6)
    (0 2 5)
    (0 1 2 3 4 5 6)
    (0 1 2 3 5 6)))


(defun find-number (num seven)
  (let* ((positions (sort (mapcar (lambda (digit) (position digit seven)) (coerce num 'list)) #'<))
         (number (position-if (curry #'equal positions) seven-segment-positions)))
    (write-to-string number)))

(defun solve-one (digits output)
  (let* ((one (car (digits-with-length digits 2)))
         (four (car (digits-with-length digits 4)))
         (seven (car (digits-with-length digits 3)))
         (top (car (set-difference seven one)))
         (zero-six-or-nine (digits-with-length digits 6))
         (six-position (position 1 (mapcar #'length (mapcar (curry #'intersection one) zero-six-or-nine))))
         (six (nth six-position zero-six-or-nine))
         (top-right (car (set-difference one six)))
         (bottom-right (car (set-difference one (list top-right))))
         (two-three-or-five (digits-with-length digits 5))
         (horizontal-lines (intersection (apply #'intersection (butlast two-three-or-five))
                                         (third two-three-or-five)))
         (top-left (car (set-difference four (append one horizontal-lines))))
         (middle (car (intersection four horizontal-lines)))
         (bottom (car (set-difference horizontal-lines (list top middle))))
         (bottom-left (car (set-difference six (append horizontal-lines one (list top-left)))))
         (seven-segment (list top top-left top-right middle bottom-left bottom-right bottom))
         (numbers (mapcar (rcurry #'find-number seven-segment) output))
         (number (parse-integer (list-to-string numbers))))
    number))

(reduce #'+ (mapcar (curry #'apply #'solve-one) data))
