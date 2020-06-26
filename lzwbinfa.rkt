#lang racket

(require racket/list)

(struct node (value [left #:mutable] [right #:mutable]) #:transparent)

(define tree (list))
(define current-node null)

(define user-input (read-line))

(define ! not)
(define (!= a b) (not (= a b)))
(define (my-list-ref lst pos)
  (define (inner lsst ppos)
    (cond
      [(! (pair? lsst)) (if (= pos ppos)
                            lsst
                            (error "Item cannot be found in list.")
                            )]
      [(null? lsst) (error "Item cannot be found in list.")]
      [else (inner (cdr lsst) (add1 ppos))]
      )
    )
  (inner lst 0)
  )



(define (LZWBinTreeBuilder str)
  (cond
    [(equal? str "") (error "Can't add empty to the tree")]
    )
  (define (inner lst)
    (cond
      [(null? lst) (void)]
      [(null? tree) (if (equal? (car lst) #\0)
                        (begin                          
                          (set! tree (append tree (list (node 0 null null))))
                          (set! current-node 0)
                          )
                        (begin
                          (set! tree (append tree (list (node 1 null null))))
                          (set! current-node 0)
                          )
                        ) (inner (cdr lst))]
      [else (if (equal? (car lst) #\0)
                (if (null? (node-left (list-ref tree current-node)))
                    ;TRUE
                    (begin
                      (let ([pointed-node (list-ref tree current-node)])
                        (set-node-left! pointed-node (length tree))
                        (list-set tree current-node pointed-node)
                        (set! current-node 0)
                        (set! tree (append tree (list (node 0 null null))))
                        )
                      )
                    ;FALSE
                    (set! current-node (node-left (list-ref tree current-node)))
                    )
                (if (null? (node-right (list-ref tree current-node)))
                    ;TRUE
                    (begin
                      (let ([pointed-node (list-ref tree current-node)])
                        (set-node-right! pointed-node (length tree))
                        (list-set tree current-node pointed-node)
                        (set! current-node 0)
                        (set! tree (append tree (list (node 1 null null))))
                        )
                      )
                    ;FALSE
                    (set! current-node (node-right (list-ref tree current-node)))
                    )
                ) (inner (cdr lst))]
      )
    (void)
    )
  (inner (string->list str))
  ;(set! tree (append tree empty))
  )


(LZWBinTreeBuilder user-input)

;tree

(define (preorder-traversal Node prefix)
  (cond
    [else
     (display (string-append prefix (number->string (node-value Node))))
     (newline)
     (if (null? (node-left Node))
         (void)
         (preorder-traversal (list-ref tree (node-left Node)) (string-append prefix "--"))     
         )
     (if (null? (node-right Node))
         (void)
         (preorder-traversal (list-ref tree (node-right Node)) (string-append prefix "--"))     
         )
     ]
    )
  )
(display "Value of nodes in tree:")
(newline)
(preorder-traversal (list-ref tree 0) "")