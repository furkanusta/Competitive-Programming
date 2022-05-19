;; Algorithm changed from 14a.lisp
;;
;; Instead of building the whole string we are only storing the pairs
;;
;; Note that at the end, when we are counting the letters, we are only considering the first letter
;; of each pair, otherwise it double-counts. Because of that, we need to add the last character of
;; the input string additionally.
;;
(require 'util)
(in-package :my-aoc)

(let* ((raw-data (read-file "14.inp"))
       (input (car raw-data))
       (rule-list (mapcar (curry #'str:split " -> ") (nthcdr 2 raw-data)))
       (rules (hash-table-from-list rule-list :test #'equal))
       (pairs (make-hash-table :test #'equal)))
  (for:for
   ((first over input)
    (second over (subseq input 1))
    (pair = (str:concat (string first) (string second))))
   (incf (gethash pair pairs 0)))

  (dotimes (i 40)
    (let ((new-pairs (make-hash-table :test #'equal)))
      (for:for
       (((key value) table-pairs pairs)
        (rule = (gethash key rules)))
       (when rule
         (let ((new1 (concatenate 'string (subseq key 0 1) rule))
               (new2 (concatenate 'string rule (subseq key 1)))
               (pair-count (gethash key pairs 0)))
           (incf (gethash new1 new-pairs 0) pair-count)
           (incf (gethash new2 new-pairs 0) pair-count))))
      (setf pairs new-pairs)))
  (let ((letters (make-hash-table :test #'equal)))
    (for:for
     (((key value) table-pairs pairs)
      (first = (subseq key 0 1))
      (second = (subseq key 1)))
     (incf (gethash first letters 0) value))
    (incf (gethash (str:s-last input) letters))
    (apply #'- (multiple-value-list (for:for
                                     (((key value) table-pairs letters)
                                      (mx maximizing value)
                                      (mn minimizing value)))))))
