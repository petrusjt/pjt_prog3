#lang racket

(define (reply s)
  (if (and (string? s) (>= (string-length s) 5) (equal? (substring s 0 5) "hello"))
      "Hi."
      "Heh??"
      )
  )