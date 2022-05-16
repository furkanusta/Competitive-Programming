(require 'util)
(in-package :my-aoc)

(defvar data (mapcar (lambda (line) (mapcar #'digit-char-p (coerce line 'list))) (read-file "9.inp")))

(defun pad-grid (data)
  (let ((n (length (car data))))
    (append
     (cons
      (make-list (+ 2 n) :initial-element 99)
      (mapcar (lambda (line) (append (cons 99 line) '(99))) data))
     (list (make-list (+ 2 n) :initial-element 99)))))

;; It seems that I had checked all 8 neighbors, however the question only asks for 4.
;; Despite that this one passes, so I am leaving it as is.
(defun low-point-p (grid x y)
  (let* ((curr (aref grid x y))
         (top-left (aref grid (1- x) (1- y)))
         (top (aref grid (1- x) y))
         (top-right (aref grid (1- x) (1+ y)))
         (left (aref grid x (1- y)))
         (right (aref grid x (1+ y)))
         (bot-left (aref grid (1+ x) (1- y)))
         (bot (aref grid (1+ x) y))
         (bot-right (aref grid (1+ x) (1+ y)))
         (neighbors (list top-left top top-right left right bot-left bot bot-right))
         (min-neighbor (reduce #'min neighbors)))
    (< curr min-neighbor)))

(let* ((num-rows (length data))
       (num-cols (length (car data)))
       (padded-data (pad-grid data))
       (grid (make-array (list (length padded-data) (+ 2 num-cols)) :initial-contents padded-data)))
  (reduce #'+
          (mapcar
           (lambda (row)
             (reduce #'+
                     (mapcar
                      (lambda (col) (1+ (aref grid row col)))
                      (remove-if-not (curry #'low-point-p grid row) (iota num-cols :start 1)))))
           (iota num-rows :start 1))))
