#lang racket
;első előfordulást törli
(define (myremove v lst)
  (cond
    [(null? lst) (append null null)]
    [(equal? v (car lst)) (append null (cdr lst))]
    [else (append (list (car lst)) (myremove v (cdr lst)))]
    )
  )

(define (myremove2 v lst)
  (cond
    [(null? lst) (append null null)]
    [(equal? v (car lst)) (append null (myremove2 v (cdr lst)))]
    [else (append (list (car lst)) (myremove2 v (cdr lst)))]
    )
  )

(myremove 2 '(1 2 3 4 5 6 2 8 9))
(myremove2 2 '(1 2 3 4 5 6 2 8 9))
