;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4_4_4quadratic) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (how-many a b c)
  (cond
    [(< (* 4 a c) (sqr b)) 2]
    [(> (* 4 a c) (sqr b)) 0]
    [else 1]))

(= (how-many 1 0 -1) 2)
(= (how-many 2 4 2) 1)

