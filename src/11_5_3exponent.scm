;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11_5_3exponent) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; exponent: number number -> number
;; calculate the value of x to the nth power (x^n)
(define (exponent x n)
  (cond
    [(zero? n) 1]
    [else (multiply x (exponent x (sub1 n)))]))

;; multiply: number number -> number
;; multiply a and b without using scheme's *
(define (multiply a b)
  (cond
    [(zero? a) 0]
    [else (+ b (multiply (sub1 a) b))]))

;; tests
(= 10 (multiply 2 5))
(= 0 (multiply 0 5))
(= 1 (exponent 2 0))
(= 4 (exponent 2 2))
(= 8 (exponent 2 3))
(= 16 (exponent 2 4))