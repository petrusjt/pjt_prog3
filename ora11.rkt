#lang racket


(define (dividers n)   
    ;(define num n)
    (define (osztoi i)
        (cond
        [(= n i) '()]
        [(= (modulo n i) 0) (append (list i) (osztoi (add1 i)))]
        [else (append '() (osztoi (add1 i)))]
        )
    )
    (osztoi 1)
)
;TODO: Write a wrapper and make it tail recursive
(define (sum-list lst)
    (cond
    [(null? lst) 0]
    [else (+ (car lst) (sum-list (cdr lst)))]
    )
    
)

(sum-list (dividers 284))
(sum-list (dividers 220))

;======================================================================================================================


;closure - beágyozott belső függvényhez rögzítünk külső értékeket

;ebben a példában a g-hez az X értéket

(define (f x)
    (define (g y)
        (+ x y)
    )
    g
)

(f 5)
((f 5) 20)



(define (dividers2 n)
    (define lst (range 1 (- n 1)))
    (filter (lambda (i) (= (modulo n i)) 0) lst)
)

(dividers2 20)
