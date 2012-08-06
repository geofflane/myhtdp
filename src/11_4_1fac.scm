;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11_4_1fac) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (! n)
  (cond
    [(= 1 n) 1]
    [else (* n (! (sub1 n)))]))


;; tests
(! 2)
(* 2 (! 1))
(* 2 1)

(= 6 (! 3))
(! 10)
(! 100)
(! 1000)
