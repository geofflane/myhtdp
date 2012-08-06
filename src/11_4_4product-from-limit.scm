;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11_4_4product-from-limit) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Let limit be a natural number. A natural number [>= limit] (N[>=limit]) is either
;; 1. limit or
;; 2. (add1 n) if n is a natural number [>= limit].

;; product: N[limit] N [>= limit]  ->  N
;;  to compute n  ·  (n - 1)  ·  ...  ·  (limit + 1)  ·  1
(define (product limit n)
    (cond
    [(= n limit) 1]
    [else (* n (product limit (sub1 n)))]))

