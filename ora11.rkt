#lang racket


(define (dividers n)   
    (define (osztoi n i)
        (cond
        [(= n i) '()]
        [(= (modulo n i) 0) (append (list i) (osztoi n (add1 i)))]
        [else (append '() (osztoi n (add1 i)))]
        )
    )
    (osztoi n 1)
)

(dividers 20)