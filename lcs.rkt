#lang racket
(require racket/trace)
(define (lcs str1 str2)
  (define (lcs-inner lst1 lst2 l)
    (cond
      [(or (null? lst1) (null? lst2)) l]
      [(eq? (car lst1) (car lst2)) (lcs-inner (cdr lst1) (cdr lst2) (add1 l))]
      [else (max (lcs-inner (cdr lst1) lst2 l) (lcs-inner lst1 (cdr lst2) l))]
      )
    )
  ;(trace lcs-inner)
  (lcs-inner (string->list str1) (string->list str2) 0)
  )

(define (lcs-hash str1 str2)
  (define ht (make-hash))
  (define (lcs-inner lst1 lst2)
    (define hash-key (list lst1 lst2))
    (cond
      [(hash-ref ht hash-key #f) (hash-ref ht (list lst1 lst2))]
      [(or (null? lst1) (null? lst2)) 0]
      [(eq? (car lst1) (car lst2)) (hash-set! ht hash-key (+ 1 (lcs-inner (cdr lst1) (cdr lst2)))) (hash-ref ht (list lst1 lst2))]
      [else (hash-set! ht hash-key (max (lcs-inner (cdr lst1) lst2) (lcs-inner lst1 (cdr lst2)))) (hash-ref ht (list lst1 lst2))]
      )
    )
  ;(trace lcs-inner)
  (lcs-inner (string->list str1) (string->list str2))
  )

(lcs "bcacbcabbaccbab" "bccabccbbabacbc")

(lcs-hash "bcacbcabbaccbab" "bccabccbbabacbc")
(lcs-hash "abcdefghijklmnopqrstuvwxyz" "a0b0c0d0e0f0g0h0i0j0k0l0m0n0o0p0q0r0s0t0u0v0w0x0y0z0")