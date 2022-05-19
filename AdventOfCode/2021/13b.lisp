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
;; Same folding code from 13a.lisp

(let* ((raw-data (read-file "13.inp"))
       (empty-line (position-if #'str:emptyp raw-data))
       (lines-before (subseq raw-data 0 empty-line))
       (lines-after (subseq raw-data (1+ empty-line)))
       (coords (mapcar (lambda (line) (mapcar #'parse-integer (str:split "," line))) lines-before))
       (folds (mapcar (lambda (line) (str:split "=" (subseq line 11))) lines-after))
       (num-cols (1+ (reduce #'max (mapcar #'car coords))))
       (num-rows (1+ (reduce #'max (mapcar #'cadr coords))))
       (grid (make-array (list num-rows num-cols))))
  (mapc (lambda (coord) (setf (aref grid (cadr coord) (car coord)) 1)) coords)
  (dolist (fold folds)
    (setf (values num-rows num-cols) (fold-grid grid num-rows num-cols fold)))
  (dotimes (i num-rows)
    (dotimes (j num-cols)
      (format t "~a" (if (= 1(aref grid i j)) "*" "."))
      (when (= 4 (mod j 5))
        (format t " ")))
    (format t "~%"))
  (format t "~%"))
