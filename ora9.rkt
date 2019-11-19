#lang racket



;listából dictionary-t/hash táblát készít
(define (list->hash lst)
  (define ht (make-hash))
  (define (lst->hsh lst)
    (cond
      [(null? lst) "Got empty list. Returning..."]
      [else
       (hash-set! ht (caar lst) (cdar lst))
       (lst->hsh (cdr lst))
       ]
      )
    )
  (lst->hsh lst)
  ht
  )

(list->hash (list '(1 2 3) '(2 4) '(4 3 5) '(3 5 6 9)) )
(list->hash (list '(1 7 9) '(2 5 7) '(5 7 9) '(9)) )
