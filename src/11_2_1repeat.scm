;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11_2_1repeat) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; repeat : number symbol   ->  list-of-symbols
;; to create a list of n copies of sym

;; Template
;(define (f-ofns n)
;  (cond
;    [(zero? n) ...]
;    [else ...]))
(define (repeat n sym)
  (cond
    [(zero? n) empty]
    [else (cons sym (repeat (sub1 n) sym))]))


;; tests
(repeat 0 'foo)
empty  ;; expected

(repeat 2 'foo)
(cons 'foo (cons 'foo empty)) ;; expected

;; tests
(repeat 4 'foo)
(cons 'foo (cons 'foo (cons 'foo (cons 'foo empty)))) ;; expected