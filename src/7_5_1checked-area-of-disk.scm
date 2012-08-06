;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7_5_1checked-area-of-disk) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; checked-area-of-disk : Scheme-value  ->  number
;; to compute the area of a disk with radius v, 
;; if v is a positve number
(define (checked-area-of-disk v)
  (cond
    [(and (number? v) (< 0 v)) (area-of-disk v)]
    [else (error 'checked-area-of-disk "positive number expected")]))