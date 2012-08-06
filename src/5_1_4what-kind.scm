;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5_1_4what-kind) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (what-kind a b c)
  (cond
    [(= 0 a) 'degenerate]
    [(< (* 4 a c) (sqr b)) 'two]
    [(> (* 4 a c) (sqr b)) 'none]
    [else 'one]))

(symbol=? (what-kind 1 0 -1) 'two)
(symbol=? (what-kind 2 4 2) 'one)
(symbol=? (what-kind 0 4 2) 'degenerate)

