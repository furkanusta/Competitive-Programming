(require 'util)
(in-package :my-aoc)

(ql:quickload :for)

(defun fold-grid (grid num-rows num-cols fold)
  (let ((horizontal-fold-p (string= "y" (car fold)))
        (fold-line (parse-integer (cadr fold))))
    (if horizontal-fold-p
        (let ((end-line (min (1+ (* 2 fold-line)) num-rows)))
          (for:for
           ((i from fold-line :to end-line))
           (for:for
            ((j from 0 :to num-cols))
            (let* ((mirror-i (- (* 2 fold-line) i))
                   (mirror-val (aref grid mirror-i j))
                   (new-val (min 1 (+ mirror-val (aref grid i j)))))
              (setf (aref grid mirror-i j) new-val))))
          (values fold-line num-cols))
        (let ((end-line (min (1+ (* 2 fold-line)) num-cols)))
          (for:for
           ((i from 0 :to num-rows))
           (for:for
            ((j from fold-line :to end-line))
            (let* ((mirror-j (- (* 2 fold-line) j))
                   (mirror-val (aref grid i mirror-j))
                   (new-val (min 1 (+ mirror-val (aref grid i j)))))
              (setf (aref grid i mirror-j) new-val))))
          (values num-rows fold-line)))))

;; Coordinate system in the question is the transpose of the usual array notation
(let* ((raw-data (read-file "13.inp"))
       (empty-line (position-if #'str:emptyp raw-data))
       (lines-before (subseq raw-data 0 empty-line))
       (lines-after (subseq raw-data (1+ empty-line)))
       (coords (mapcar (lambda (line) (mapcar #'parse-integer (str:split "," line))) lines-before))
       (folds (mapcar (lambda (line) (str:split "=" (subseq line 11))) lines-after))
       (fold (car folds))
       (num-cols (1+ (reduce #'max (mapcar #'car coords))))
       (num-rows (1+ (reduce #'max (mapcar #'cadr coords))))
       (grid (make-array (list num-rows num-cols))))
  (mapc (lambda (coord) (setf (aref grid (cadr coord) (car coord)) 1)) coords)
  (let* ((dimensions (multiple-value-list (fold-grid grid num-rows num-cols fold)))
         (x (car dimensions))
         (y (cadr dimensions)))
    (for:for ((i from 0 :to x)
              (points summing (for:for ((j from 0 :to y) (row summing (aref grid i j)))))))))
