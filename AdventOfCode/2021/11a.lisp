(require 'util)
(in-package :my-aoc)

(defun inc-cell (grid i j)
  (let ((rows (array-dimension grid 0))
        (cols (array-dimension grid 1)))
    (when (and (>= i 0) (>= j 0) (< i rows) (< j cols) (aref grid i j))
      (incf (aref grid i j)))))

(defun flash (grid first-time)
  (let ((rows (array-dimension grid 0))
        (cols (array-dimension grid 1))
        (flashed '()))
    (dotimes (i rows)
      (dotimes (j cols)
        (when first-time
          (inc-cell grid i j))
        (when (and (aref grid i j) (>= (aref grid i j) 10))
          (setf (aref grid i j) nil)
          (push (cons i j) flashed))))
    (dolist (cell flashed)
      (let ((i (car cell))
            (j (cdr cell)))
        (inc-cell grid (1+ i) (1+ j))
        (inc-cell grid (1+ i)     j)
        (inc-cell grid (1+ i) (1- j))
        (inc-cell grid     i  (1+ j))
        (inc-cell grid     i  (1- j))
        (inc-cell grid (1- i) (1+ j))
        (inc-cell grid (1- i)     j)
        (inc-cell grid (1- i) (1- j))))
    (when flashed
        (flash grid nil))
    (when first-time
      (let ((flash-count (reduce #'+ (mapcar (curry #'count nil) (array-rows grid)))))
        (dotimes (i rows)
          (dotimes (j cols)
            (when (not (aref grid i j))
              (setf (aref grid i j) 0))))
        flash-count))))

(let* ((raw-data (read-file "11.inp"))
       (n (length raw-data))
       (m (length (car raw-data)))
       (data (mapcar (lambda (line) (mapcar #'digit-char-p (coerce line 'list))) raw-data))
       (grid (make-array  (list n m) :initial-contents data))
       (total-flash-count 0))
  (dotimes (i 100 total-flash-count)
    (incf total-flash-count (flash grid t))))
