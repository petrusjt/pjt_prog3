#lang racket

;sort lst less-than?
(define (hr) (display "===============================================\n"))
(sort '(1 3 4 2 5) <)
;string<? stringek összehasonlitás
(sort '("barack" "korte" "alma" "afonya" "eper" "malna" "kiwi") string<?)
;sort lst less-than? #:key extract-key #:cache-keys? cache-key?
(sort '(("barack") ("korte") ("alma") ("afonya") ("eper") ("malna") ("kiwi")) #:key car string<?)
;(lambda (x y) (less-than (extract-key x) (extract-key y)))
;(sort '("barack" "korte" "alma" "afonya" "eper" "malna" "kiwi") #:key random string<?)
;keresés listákban
(hr)
;Az elemeket equal? predikátummal hasonlitja
;rövid: member v lst
;hosszú member v lst is-equal?
(member 2 '(1 2 3 4))
(member 9 '(1 2 3 4))
(member #'x (list #'x #'y) free-identifier=?)
;memv ~ member, de összehasonlitásra az eqv? predikátummal hasonlitja
(memv 3 '(1 2 3 4 5))
;memq ~ member, de eq? predikátummal hasonlit
(memq 3 '(1 2 3 4 5))
;memf proc lst - lista összes elemére alkalmazza és addig megy, mig hamisat nem talál
(memf (lambda (arg) (> arg 9)) '(1 2 3 4 5 6 7 8 9 10 11))
;findf proc lst
(findf (lambda (arg) (> arg 9)) '(1 2 3 4 5 6 7 8 9 10 11))
(hr)
;assoc v lst 
;assoc v lst is-equal?
(assoc 3 (list (list 1 2) (list 3 4) (list 5 6)))
(assoc 3.5 (list (list 1 2) (list 3 4) (list 5 6)) (lambda (x y) (< (abs (- x y)))))
;assv - összehas.: eqv?
;assq - összehas.: eq?
(assv 3 (list (list 1 2) (list 3 4) (list 5 6)))
(assv 'c (list (list 'a 'b) (list 'c 'd) (list 'e 'f)))
;assf proc lst ~ findf
(assf (lambda (x) (> x 2)) (list (list 1 2) (list 3 4) (list 5 6)))
(hr)
;hozzáférő függvények röviditései
(car (car '((1 2) 3 4)))
(caar '((1 2) 3 4))

(car (cdr '((1 2) 3 4)))
(cadr '((1 2) 3 4))

(cdr (car '((1 2) 3 4)))
(cdar '((1 2) 3 4))

(cdr (cdr '((1 2) 3 4)))
(cddr '((1 2) 3 4))
;páronként ugyanazok
(caaaar '((((1 2) 3) 4) 5)) ;4 a/b a leghosszabb ilyen rövidités
(hr)
;további listakezelő fv-k s szinonimák
(require racket/list) ;racket list könyvtára
;listaelemek sorrendje és tipusa mind1
(equal? empty null)
(cons? '(1 2));   == pair?
(empty? empty);   == null?
(first '(1 2 3)); == car
(rest '(1 2 3));  == cdr
(second '(1 2 3))
(eighth '(1 2 3 4 5 6 7 8 9 10)) ; max 10.
(last '(1 2 3 4 5))
(define (my-last lst)
  (cond
    [(null? lst) '()]
    [(null? (cdr lst)) (car lst)]
    [else (my-last (cdr lst))]
    )
  )

(my-last '(1 2 3 4 5 6 7 8 9 10))
;last-pair
(last-pair (cons 1 (cons 2 '())))
;make-list k v
(make-list 10 5)
;list-update lst pos updater == (updater (list-ref lst post))
(list-update '(zero one two) 1 symbol->string)
(list-set '(zero one two) 2 symbol->string)
;index-of lst v is-equal?
(index-of '(4 1 7 10 5 2) 5 >)
(index-where '(1 2 3 4 5 6 7 8) even?)
(indexes-of '(4 6 3 4 5 6) 4)
(indexes-where '(1 2 3 4 5 6) even?)
;take lst pos - első 4 elemből képzett lista
(take '(1 2 3 4 5 6) 4)
(take 'non-list 0)
(drop '(1 2 3 4 5 6) 2)
;HF
;my-take lst pos
;my-drop lst pos
;split-at lst pos
(values (take '(1 2 3 4 5) 2) (drop '(1 2 3 4 5) 2));következővel azonos
(split-at '(1 2 3 4 5) 2)