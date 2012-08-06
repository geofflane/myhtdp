;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11_5_2multiply-by-pi) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; multiple-by-pi: N -> number
;; multiply 3.14 by n without using scheme's *
(define (multiply-by-pi n)
  (cond
    [(zero? n) 0]
    [else (+ 3.14 (multiply-by-pi (sub1 n)))]))

;; tests
(= (multiply-by-pi 0) 0)
(= (multiply-by-pi 2) 6.28)
(= (multiply-by-pi 3) 9.42)