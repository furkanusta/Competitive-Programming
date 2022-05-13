(require 'util)

(defvar data (read-file "3.inp"))

(defun chars (str)
  (mapcar (lambda (elt) (map 'list #'digit-char-p elt)) str))

(defun binary-to-decimal (lst)
  (reduce (lambda (x y) (+ (* 2 x) y)) lst))

(defvar bits (chars data))
(defvar column-count (length (car bits)))
(defvar bit-count (make-array column-count))

(dolist (elem bits)
  (dotimes (i column-count)
    (when (= 1 (nth i elem))
      (incf (aref bit-count i)))))

(defvar most-common
  (mapcar (lambda (x) (if x 1 0))
          (map 'list (lambda (elt) (> elt (/ (length bits) 2))) bit-count)))

(defvar gamma (binary-to-decimal most-common))
(defvar epsilon (- (expt 2 column-count) gamma 1))

(print (* gamma epsilon))
