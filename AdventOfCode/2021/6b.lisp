(require 'util)
(in-package :my-aoc)

(defvar data
  (mapcar (rcurry #'mod 7)
          (mapcar #'parse-integer (str:split "," (car (read-file "6.inp"))))))

(let ((counts (map 'vector (rcurry #'count data) (iota 7)))
      (new-fish (make-array '(7) :initial-element 0)))
  (dotimes (i 256 (+
                   (reduce #'+ counts :initial-value 0)
                   (reduce #'+ new-fish :initial-value 0)))
    (let ((index (mod i 7))
          (next-index (mod (+ i 2) 7)))
      (incf (aref new-fish next-index) (aref counts index))
      (incf (aref counts index) (aref new-fish index))
      (setf (aref new-fish index) 0))))

;; (mapc
;;  (lambda (test-data)
;;    (let* ((data (mapcar (rcurry #'mod 7) (mapcar #'parse-integer (str:split "," test-data))))
;;           (count (map 'vector (rcurry #'count data) (iota 7))))
;;      (format t "~a~%" (reduce #'+ count :initial-value 0))
;;      ;; (format t "|| ~a ||~%" count)
;;      ))
;;    '("3,4,3,1,2"
;;      "2,3,2,0,1"
;;      "1,2,1,6,0,8"
;;      "0,1,0,5,6,7,8"
;;      "6,0,6,4,5,6,7,8,8"
;;      "5,6,5,3,4,5,6,7,7,8"
;;      "4,5,4,2,3,4,5,6,6,7"
;;      "3,4,3,1,2,3,4,5,5,6"
;;      "2,3,2,0,1,2,3,4,4,5"
;;      "1,2,1,6,0,1,2,3,3,4,8"
;;      "0,1,0,5,6,0,1,2,2,3,7,8"
;;      "6,0,6,4,5,6,0,1,1,2,6,7,8,8,8"
;;      "5,6,5,3,4,5,6,0,0,1,5,6,7,7,7,8,8"
;;      "4,5,4,2,3,4,5,6,6,0,4,5,6,6,6,7,7,8,8"
;;      "3,4,3,1,2,3,4,5,5,6,3,4,5,5,5,6,6,7,7,8"
;;      "2,3,2,0,1,2,3,4,4,5,2,3,4,4,4,5,5,6,6,7"
;;      "1,2,1,6,0,1,2,3,3,4,1,2,3,3,3,4,4,5,5,6,8"
;;      "0,1,0,5,6,0,1,2,2,3,0,1,2,2,2,3,3,4,4,5,7,8"
;;      "6,0,6,4,5,6,0,1,1,2,6,0,1,1,1,2,2,3,3,4,6,7,8,8,8,8"))
