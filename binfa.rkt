#lang racket

(struct Node (val LeftChild RightChild))

(define root (Node "/" null null))
(define fa root)

(define (add-to-tree tree element)
    (define (addToLeft) 
        (cond
        [(null? (Node-LeftChild tree))
            ()
        ]
        )
    )
    (cond
    [(= (element #\0))]
    )
)