#lang racket

;listából dictionary-t/hash táblát készít
(define (list->hash lst)
  (define ht (make-hash))
  (define (lst->hsh lst)
    (cond
      [(null? lst) "Got empty list. Returning..."]
      [(hash-ref ht (caar lst) #f) (hash-set! ht (caar lst) (append (cdar lst) (hash-ref ht (caar lst)))) (lst->hsh (cdr lst))]
      [else (hash-set! ht (caar lst) (cdar lst)) (lst->hsh (cdr lst))]
      )
    )
  (lst->hsh lst)
  ht
  )


(list->hash '())
(list->hash (list '(2 3) '(3 1) '(3 6) '(6 1) '(1 5) '(1 4) '(9 5) '(4 7) '( 4 8) '(8 7) '( 6 9)))

(define (bejar ht num_of_nodes)
  (define set (make-hash))
  (define stack '())
  (define (bejar-belso ht num_of_nodes)
    1
    )
  
  (bejar-belso ht num_of_nodes)
  )

(bejar (list->hash (list '(2 3) '(3 1) '(3 6) '(6 1) '(1 5) '(1 4) '(9 5) '(4 7) '( 4 8) '(8 7) '( 6 9))) 9)