#lang racket

(define (collatz a l)
  (if (= a 1)
      l
      (if (= (modulo a 2) 0)
          (collatz (/ a 2) (+ l 1))
          (collatz (+ (* a 3) 1) (+ l 1))
          )
      )
  )

(define (collatz-call a) (collatz a 1))
(define collatz2 (lambda (a l)
                  (if (= a 1)
                      l
                      (if (= (modulo a 2) 0)
                          (collatz2 (/ a 2) (+ l 1))
                          (collatz2 (+ (* a 3) 1) (+ l 1))
                          )
                      )
                  )
  )

(letrec ([collatz3 (lambda (a l)
                  (if (= a 1)
                      l
                      (if (= (modulo a 2) 0)
                          (collatz3 (/ a 2) (+ l 1))
                          (collatz3 (+ (* a 3) 1) (+ l 1))
                          )
                      )
                  )])
  (collatz3 23 1)
  )
(define (col a l) (let collatz4 ((a a)(l l))
              (cond
                [(= a 1) l]
                [(= (modulo a 2) 0) (collatz4 (/ a 2) (+ l 1))]
                [(= (modulo a 2) 1) (collatz4 (+ (* a 3) 1) (+ l 1))]
                )
  
  ))










