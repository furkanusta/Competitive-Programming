(require 'util)

(defvar data (read-file "3.inp"))

(defun chars (str)
  (mapcar (lambda (elt) (map 'list #'digit-char-p elt)) str))

(defun binary-to-decimal (lst)
  (reduce (lambda (x y) (+ (* 2 x) y)) lst))

(defvar bits (chars data))
(defvar element-count (length bits))
(defvar column-count (length (car bits)))

(defvar o2-rating
  (binary-to-decimal
   (car
    (let ((lst bits))
      (dotimes (i column-count lst)
        (when (> (length lst) 1)
          (let* ((count (apply #'+ (mapcar (lambda (elt) (nth i elt)) lst)))
                 (most-common (if (>= count (/ (length lst) 2)) 1 0))
                 (new-list (remove-if-not (lambda (elt) (= most-common (nth i elt))) lst)))
            (setq lst new-list))))))))

(defvar co2-rating
  (binary-to-decimal
   (car
    (let ((lst bits))
      (dotimes (i column-count lst)
        (when (> (length lst) 1)
          (let* ((count (apply #'+ (mapcar (lambda (elt) (nth i elt)) lst)))
                 (most-common (if (>= count (/ (length lst) 2)) 1 0))
                 (new-list (remove-if (lambda (elt) (= most-common (nth i elt))) lst)))
            (setq lst new-list))))))))

(print (* o2-rating co2-rating))
