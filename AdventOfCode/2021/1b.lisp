(defun read-file (filename)
  (with-open-file (stream filename)
                  (loop for line = (read-line stream nil)
                        while line
                        collect line)))

(defvar data (mapcar #'parse-integer (read-file "1.inp")))

(defvar grouped
  (loop for (a b c) on data while c
        collect (+ a b c)))

(reduce #'+
        (loop for (a b) on grouped while b
              collect (if (< a b) 1 0)))
