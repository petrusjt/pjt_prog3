#lang racket

;pair - pár

;car - első elem
;cdr - első utáni elemek

;list - lista : vagy üres, vagy olyan pár, amelynek 2. tagja egy lista

#|(pair? 1)
(pair? (cons 1 2))
(pair? (list 1 2))
(pair? '(1 2))
(pair? '())

(null? '(1))

(null? (cdr '(1)))
(cons 1 (cons 2 3))
(car (cons 1 2))
(cdr (cons 1 2))
null
(equal? null '())
(list? (cons 1 (cons 2 '())))
|#

(list 1 2 3 4 5)

(list (list 1 2 3) (list 4 5 6))
(list* 1 2)
(list* 1 2 (list 3 4))
(build-list 10 values)
(build-list 5 (lambda(x) (+ x x)))
(define (fact x)
  (if (= x 0)
      1
      (* x (fact (sub1 x)))
      )
  )
;(build-list 100 fact)
(length '())
(list-ref '(1 2 3 4) 2)

(list-tail '(1 2 3 4 5) 2)

(append '(1 2) '(3 4) '(5 6))
(reverse '(1 2 3 4))

(define (my-reverse l)
  (cond
    [(null? l) l]
    [else (append (my-reverse (cdr l)) (list (car l)))]
    )
  )

(my-reverse '(1 2 3 4 5 6 7 8 9))

(define (my-length lst)
  (cond
    [(null? lst) 0]
    [else (add1 (my-length (cdr lst)))]
    )
)

(my-length '(123 1423 525 324 12432224 325 34 252 5342142452  41242 323 1))
;map proc lst+
(map (lambda (x) (add1 x)) '(1 2 3 4))
(map (lambda (x y) (+ x y)) '(1 2 3) '(4 5 6))
;andmap proc lst+
;andmap f (list x y z) <=> (and(foldl + 0 '(1 2 3 4 5)) (f x) (f y) (f z)) || létezik ormap is
(ormap positive? '(1 2 3 -4))
(andmap + '(1 2 3) '(4 5 6))
;(for-each proc lst+) - nincs visszatérő érték
(for-each (lambda (n)
            (printf "Paraméter: ~a\n" n)
            ) '(1 2 3 4))

;foldl - fold left - foldl proc init lst
(foldl cons '() '(1 2 3 4))
(foldl + 0 '(1 2 3 4 5))
(foldl (lambda (a b result) (* result (- a b))) 1 '(1 2 3) '(4 5 6))

(foldr cons '() '(1 2 3 4))
(foldr + 0 '(1 2 3 4 5))

;listaszűrő műveletek
; filter pred lst

(filter positive? '(1 -2 2 -3 3))

;remove value lst prod*
(remove 2 '(1 2 3 2 5))
(remove 2 '(1 2 3 2 5) >)
;(remove* v-list lst [proc])

(remove* '(1 2) '(1 2 3 2 5))

;my-remove megirása -> első param érték, 2. list : mint a sima remove vagy mint a *-os változat
















































