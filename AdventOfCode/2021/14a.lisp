(require 'util)
(in-package :my-aoc)

(let* ((raw-data (read-file "14.inp"))
       (input (car raw-data))
       (rules (mapcar (curry #'str:split " -> ") (nthcdr 2 raw-data)))
       (hash (make-hash-table)))
  (dotimes (i 10)
    (setf input
     (format nil "~{~A~^~}"
          (for:for
           ((first over input)
            (second over (subseq input 1))
            (pair = (str:concat (string first) (string second)))
            (rule = (find pair rules :key #'car :test #'equal))
            (new-string collecting (concatenate 'string (unless inserted-before (string first)) (cadr rule) (string second)))
            (inserted-before = (not (null rule))))))))
  (mapc (lambda (ch) (incf (gethash ch hash 0))) (coerce input 'list))
  (apply #'- (multiple-value-list (for:for
                                   ((value table-values hash)
                                    (mx maximizing value)
                                    (mn minimizing value))))))
