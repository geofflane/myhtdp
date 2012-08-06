;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11_4_5tabulate-f-limit) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Let limit be a natural number. A natural number [>= limit] (N[>=limit]) is either
;; 1. limit or
;; 2. (add1 n) if n is a natural number [>= limit].

;; product: N[limit] N [>= limit]  ->  N
;;  to compute n  ·  (n - 1)  ·  ...  ·  (limit + 1)  ·  1
(define (tabulate-f-lim n limit)
    (cond
    [(= n limit) (f 1)]
    [else (* (f n) (tabulate-f-lim (sub1 n) limit))]))

;; f : number  ->  number
(define (f x)
  (+ (* 3 (* x x)) 
     (+ (* -6 x)
        -1)))

;; Tests
(= 32 (tabulate-f-lim 3 1))
(= -128 (tabulate-f-lim 3 0))
