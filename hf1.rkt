#lang racket
;Egész számok összege a-tól b-ig
(define (sum a b)
   (if (< a b)
     (+ a (sum (+ a 1) b))
     a
   )
)

(sum 1 5)
(sum 1 3)