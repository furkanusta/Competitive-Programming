(require 'util)

(defvar data (mapcar #'parse-integer (read-file "1.inp")))

(reduce #'+
        (loop for (a b) on data while b
              collect (if (< a b) 1 0)))
