;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4_1_2boolean) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.ss" "teachpack" "htdp")))))
; (define x 4)
; (define x 2)
(define x (/ 7 2))

(> x 3)

"a true"
"b false"
"c true"

(and (> 4 x) (> x 3))

"a false"
"b false"
"c true"

(= (* x x) x)

"a false"
"b false"
"c false"