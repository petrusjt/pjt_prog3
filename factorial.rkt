#lang racket
(define (fact x)
  (if (= x 0)
      1
      (* x (fact (- x 1))))
  )

(fact 0)
(fact 1)
(fact 5)
(fact 6)