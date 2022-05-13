(defun read-file (filename)
  (with-open-file (stream filename)
                  (loop for line = (read-line stream nil)
                        while line
                        collect line)))

(provide 'util)

(require 'str)
(in-package :str)

(require 'iterate)
(in-package :iterate)
