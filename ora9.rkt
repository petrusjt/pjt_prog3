#lang racket

(define ht (make-hash))

;listából dictionary-t/hash táblát készít
(define (list->hash lst)
  (cond
    [(null? lst) "Got empty list. Returning..."]
    [else
     (hash-set! ht (caar lst) (cdar lst))
     (list->hash (cdr lst))
     ]
    )
  )

(list->hash (list '(1 2 3) '(2 4) '(4 3 5) '(3 5 6 9)));

ht;printing the hash table to console