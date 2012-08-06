;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11_4_2product) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; product: number number -> number
;; produces the product of the numbers between n (exclusive) and m (inclusive).
;; assume: m > n
;; (------]
;; n      m
(define (product n m)
  (/ (! m) (! n)))

(define (! n)
  (cond
    [(= 1 n) 1]
    [else (* n (! (sub1 n)))]))

;; product-from-20: N [>= 20]  ->  N
;; to compute n  ·  (n - 1)  ·  ...  ·  21  ·  1
(define (product-from-20 n)
  (cond
    [(= n 20) 1]
    [else (* n (product-from-20 (sub1 n)))]))

;; tests
(= (product-from-20 21) 21)
(= (product-from-20 22) 462)
(= (product-from-20 20) 1)