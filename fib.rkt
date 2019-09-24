#lang racket

(define fib (lambda (x)
              (if (or (= x 0) (= x 1) (= x 2))
                  1
                  (+ (fib (- x 1)) (fib (- x 2)))
                  )
              ))