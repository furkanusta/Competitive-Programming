(require 'util)
(in-package :my-aoc)

(defvar data (mapcar #'parse-integer (str:split "," (car (read-file "6.inp")))))

;; There is probably a mathematical formula here to derive but this one is simple enough
(let ((fish (copy-list data)))
  (dotimes (i 80 (length fish))
    (let* ((fish-minus-1 (mapcar (rcurry #'- 1) fish))
           (cycle-done (count -1 fish-minus-1))
           (still-waiting (remove-if (curry #'= -1) fish-minus-1))
           (new-fish (append still-waiting
                             (make-list cycle-done :initial-element 6)
                             (make-list cycle-done :initial-element 8)))
           )
      (setq fish new-fish))))
