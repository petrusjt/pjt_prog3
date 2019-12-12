#lang racket

(define (my-map lst fun)
    (cond
    [(null? lst) '()]
    [else (append (list (fun (car lst))) (my-map (cdr lst) fun))]
    )
)

;(my-map '(1 2 3 4 5 6 7 8 9 10) (lambda (x) (+ x 2)))

(define (my-filter lst pred)
    (cond
    [(null? lst) '()]
    [(pred (car lst)) (append (list (car lst)) (my-filter (cdr lst) pred))]
    [else (my-filter (cdr lst) pred)]
    )
)

;(my-filter '(1 2 3 4 5 6 7 8 9 10) (lambda (x) (= (modulo x 2) 1)))



(define (BBP iterations) 
    (define (inner inner-iterations) 
        (define first (/ 1.0 (expt 16 inner-iterations)) )
        (define second (/ 4.0 (+ (* 8 inner-iterations) 1)) )
        (define third (/ 2.0 (+ (* 8 inner-iterations) 4)) )
        (define fourth (/ 1.0 (+ (* 8 inner-iterations) 5)) )
        (define fifth (/ 1.0 (+ (* 8 inner-iterations) 6)) )
        (define iteration-value (* first (- second third fourth fifth)))
        (if (> inner-iterations iterations)  
            iteration-value
            (+ iteration-value (inner (add1 inner-iterations)))
        )
    )
    (inner 0)
)

(print "BBP:")
;(BBP 100)
(println "")
(require racket/math)
(print "Beépített:")
pi
(println "")

(require math/bigfloat)

(bf-precision 500)

(define (BBP-BF iterations) 
    (define (inner sum inner-iterations) 
        (define first (bf/ (bf 1.0) (bfexpt (bf 16) inner-iterations)) )
        (define second (bf/ (bf 4.0) (bf+ (bf* (bf 8) inner-iterations) (bf 1))) )
        (define third (bf/ (bf 2.0) (bf+ (bf* (bf 8) inner-iterations) (bf 4))) )
        (define fourth (bf/ (bf 1.0) (bf+ (bf* (bf 8) inner-iterations) (bf 5))) )
        (define fifth (bf/ (bf 1.0) (bf+ (bf* (bf 8) inner-iterations) (bf 6))) )
        (define iteration-value (bf* first (bf- second third fourth fifth)))
        ;(println (string-append "Current: " (bigfloat->string (bf+ sum iteration-value))))
        (if (bf> inner-iterations iterations)  
            (bf+ sum iteration-value)
            (inner (bf+ sum iteration-value) (bf+ inner-iterations (bf 1)))
        )
    )
    (inner (bf 0) (bf 0))
)

;(BBP-BF (bf 1000))

(define (leibniz-approximation iterations) 
    (define (inner sum inner-iterations)
        (cond
        [(> inner-iterations iterations) sum]
        [else (if (= (modulo inner-iterations 2) 0)
            (inner (+ sum (/ 1.0 (+ 1 (* inner-iterations 2)))) (add1 inner-iterations))
            (inner (- sum (/ 1.0 (+ 1 (* inner-iterations 2)))) (add1 inner-iterations))
        )]
        )
    )
    (* 4 (inner 0 0))
)

;(leibniz-approximation 5000000000)

(define (reverse-string str)
    (define (reverse lst) 
        (cond
        [(null? lst) '()]
        [else (append (reverse (cdr lst)) (list (car lst)))]
        )
    )
    (list->string (reverse (string->list str)))
)

