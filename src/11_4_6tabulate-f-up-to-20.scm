;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11_4_6tabulate-f-up-to-20) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; A natural number [<= 20] (N[<=20]) is either
; 1. 20 or
; 2. (sub1 n) if n is a natural number [<= 20].

;; tabulate-f-up-to-20 : N [<= 20]  ->  N
;; Combine n with a list-of-posns where (make-posn n (f n))
;; where (f n) is all functions of n (sub1 n) <= 20
(define (tabulate-f-up-to-20 n-below-20)
  (cond
    [(> n-below-20 20) empty]
    [else (cons (make-posn n-below-20 (f n-below-20)) (tabulate-f-up-to-20 (add1 n-below-20)))]))

;; f : number  ->  number
(define (f x)
  (+ (* 3 (* x x)) 
     (+ (* -6 x)
        -1)))

(empty? (tabulate-f-up-to-20 21))
(tabulate-f-up-to-20 20)
(cons (make-posn 20 1079) empty) ;; expected

(tabulate-f-up-to-20 5)