#lang racket

;currying
;f: X x Y -> Z adott

;vez. be egy új h fv-t köv.képpen:
;h: X -> (Y -> Z)

;használat: h(x)(y) = f(x,y)
;Ekkor curry(f) = h

(define (divisors-of n)
    (filter (compose 
        (curry = 0) ((curry modulo n))
    ) (range 1 n))

)

(divisors-of 5000)

(((curry +) 10) 3)

;1. feladat: predikátum, palindróm lista? (nem lehet beépitett reverse fv)

(define (palindrom lst)
    (define (my-reverse lt) 
        (cond
        [(null? lt) '()]
        [else (append (my-reverse (cdr lt)) (list (car lt)))]
        )
    )
    (equal? (my-reverse lst) lst)
)

(palindrom '(4 2 2 4))

;2. feladat: fv, amely Pascal-háromszög n-edig sorának elemeit adja egy listában (binomok)

(define (pascal-n n)
    (define (fact nn)
        (if (> nn 1)
            (* nn (fact (sub1 nn)))
            1
        )
    )
    (define (combination k)
        (/ (fact n) (* (fact k) (fact (- n k))))
    )

    (define (inner iteration)
        (cond
        [(> iteration n) '()]
        [else (append (list (combination iteration)) (inner (add1 iteration)))]
        )
    )
    (inner 0)
)

(pascal-n 3)
;3. feladat: fv, amely paraméterként megadott egészeket tart. lista egy permutációként tekinti és előállitja a listaelemek lexikografikusna rákövetkező permutációját
;(1 2 3 4) -> (1 2 4 3) -> (1 3 2 4) -> ... -> (4 3 2 1) -> null

;4. feladat: kockapóker => dobás(5 elemű lista) -> kiértékelése

;5. fv: 10000-nél kisebb számok, amelyek forditottjukkal vett összege palindrom szám

(define (number->list num) 
    (string->list (number->string num))
)
(define (list->number lst) 
    (string->number (list->string lst))
)

(filter (lambda (num)
    (palindrom (number->list(+ num (list->number(reverse (number->list num))))))
) (build-list 10000 values))