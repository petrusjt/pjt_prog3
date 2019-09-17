#lang racket

(define (fact x)
  (if (= x 0)
      1
      (* x (fact (- x 1)))
      )
  )

#|(define (pos? x y z)
  (if (and (number? x) (number? y) (number? z))
      (if (and (> x 0) (> y 0) (> z 0))
          #t
          #f
          )
      #f
      )
  )
(define (pos2? x y z)
  (and (> x 0) (> y 0) (> z 0))
  )
(define (hasneg? x y z)
  (if (and (number? x) (number? y) (number? z))
      (if (or (< x 0) (< y 0) (< z 0))
          #t
          #f
          )
      #f
      )
  )
(define (hasneg2? x y z)
  (or (< x 0) (< y 0) (< z 0))
  )



((lambda (x) (* x 2)) 42) ;lambda kif. példa
((lambda (x y) (/ (+ x y) 2)) 20 40) ;több paraméteres lambda függvény

(define dbl (lambda (x) (* 2 x)))
(define quad (lambda (x) (dbl (dbl x))))
|#
#|
(define n 10)
(define small? (lambda (num) (<= num n)))
(define sqr (lambda (n) (* n n)))

(small? (sqr 3))
|#
(require racket/trace)



(define mypow (lambda (base exp)
                (if (= exp 0)
                    1
                    (* base (mypow base (- exp 1)))
                    )
                )
  )
(trace mypow)


(define (ack m n)
  (if (= m 0)
      (+ n 1)
      (if (and (> m 0) (= n 0))
          (ack (- m 1) 1)
          (ack (- m 1) (ack m (- n 1)))
          )
      )
  )

(trace ack)
(define myfact (lambda (x) 
                 (if (= x 0)
                     1
                     (* x (myfact (- x 1)))
                     )
                            
                 )
  )
(trace myfact)

(define fib (lambda (x)
              )
  )

;2 param, a,b egész foo a <= b a-b egész számok összege