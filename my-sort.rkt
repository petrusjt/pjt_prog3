#lang racket
(define (my-sort lst)
  (define (list-min lst)
    (define (find-min lst min)
      (cond
        [(null? lst) min]
        [else (if (< (car lst) min)
                  (find-min (cdr lst) (car lst))
                  (find-min (cdr lst) min)
                  )]
        )
      )
    (find-min lst (car lst))
  )
  (define sorted '())
  (define (inside-sort lst)
    (cond
      [(null? lst) sorted]
      [else (define min-val (list-min lst))
            (set! sorted (append sorted (list min-val)))
            (inside-sort (remove min-val lst))
            ]
      )
    )
  (if (list? lst)
      (inside-sort lst)
      (error "Expected argument type: List, Given: Whatever you gave it")
      )
  )
(my-sort '(1 4 2 -2 50 3000 -200 60 50))
(my-sort '(1 2 3 4 5))
(my-sort '(5 4 3 2 1))
(my-sort '())
(my-sort '(1))