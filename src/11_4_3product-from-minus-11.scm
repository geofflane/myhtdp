;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11_4_3product-from-minus-11) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; product-from-minus-11: N [>= -11]  ->  N
;; to compute n  ·  (n - 1)  ·  ...  ·  -10  ·  1
(define (product-from-minus-11 n)
  (cond
    [(= n -11) 1]
    [(= n 0) (* 1 (product-from-minus-11 (sub1 n)))]
    [else (* n (product-from-minus-11 (sub1 n)))]))

(= 1 (product-from-minus-11 -11))

