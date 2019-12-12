#lang racket
(define (topcollatz ao)
    (let loop ( (n ao) (l (list ao)))
        (if (= 1 n)
            l
            (if (even? n)
                (loop (/ n 2) (append l (list (/ n 2))))
                (loop (+ 1 (* 3 n )) (append l (list (+ 1 (* 3  n )))))
            )
        )
    )
)

(topcollatz 3)