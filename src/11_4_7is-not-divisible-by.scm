;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11_4_7is-not-divisible-by) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; A natural number is either
; 1. 1 or
; 2. (add1 n) if n is a natural number.

;; is-not-divisible-by<=i: number number -> boolean
;; If m is not divisible by any number between 1 (exclusive) and i (inclusive), 
;; the function produces true; otherwise, its output is false.
;; assumptions: i < m
(define (is-not-divisible-by<=i i m)
  (cond
    [(= i 1) true]
    [else (and
           (not (zero? (remainder m i)))
           (is-not-divisible-by<=i (sub1 i) m))]))

;; prime: number -> boolean
;; determines whether a number is a prime number
(define (prime? n)
  (is-not-divisible-by<=i (sub1 n) n))

;; tests
(is-not-divisible-by<=i 2 9)
(is-not-divisible-by<=i 4 5)
(is-not-divisible-by<=i 12 13)

(not (prime? 4))
(not (prime? 12))
(prime? 13)
(prime? 17)
(prime? 19)
(prime? 23)