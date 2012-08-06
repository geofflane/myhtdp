;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4_2_3equations) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.ss" "teachpack" "htdp")))))
(define (equation1 n)
  (= (+ (* 4 n) 2)  62))

(define (equation2 n)
  (= (* 2 (sqr n)) 102))

(define (equation3 n)
  (= (+ (* 4 (sqr n)) (* 6 n) 2) 462))

(equation1 10)
(equation1 12)
(equation1 14)
"--"
(equation2 10)
(equation2 12)
(equation2 14)
"--"
(equation3 10)
(equation3 12)
(equation3 14)