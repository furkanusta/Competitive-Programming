(require 'util)
(in-package :my-aoc)

(defun traverse (grid mark x y)
  (if (or (= (aref mark x y) 1)
          (= (aref grid x y) 9))
      0
      (progn
        (setf (aref mark x y) 1)
        (+
         1
         (traverse grid mark (1+ x) y)
         (traverse grid mark (1- x) y)
         (traverse grid mark x (1+ y))
         (traverse grid mark x (1- y))))))

(let* ((data (mapcar (lambda (line) (mapcar #'digit-char-p (coerce line 'list))) (read-file "9.inp")))
       (padded-data (pad-grid data 9))
       (num-rows (length data))
       (num-cols (length (car data)))
       (grid (make-array (list (length padded-data) (+ 2 num-cols)) :initial-contents padded-data))
       (mark (make-array (array-dimensions grid))))
  (apply #'*
         (subseq (sort
                  (mapcan
                   (lambda (row) (mapcar (curry #'traverse grid mark row) (iota num-cols :start 1)))
                   (iota num-rows :start 1))
                  #'>)
                 0 3)))
