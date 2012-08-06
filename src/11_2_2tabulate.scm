;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11_2_2tabulate) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; list-of-posns is either
;; 1. empty, or
;; 2. (cons p list-of-posns) where p is a posn.
;; example:
;; (cons (make-posn n n) empty)

;; tabulate-f: number -> list-of-posns
;; Combine n with a list of posns where (make-posn n (f n))
;; where (f n) is all functions of n (sub1 n) > 0
(define (tabulate-f n)
  (cond
    [(zero? n) empty]
    [else (cons (make-posn n (f n)) (tabulate-f (sub1 n)))]))

;; f : number  ->  number
(define (f x)
  (+ (* 3 (* x x)) 
     (+ (* -6 x)
        -1)))

;; tests
(tabulate-f 0)
empty  ;; expected

(tabulate-f 1)
(cons (make-posn 1 -4) empty)  ;; expected

(tabulate-f 2)
(cons (make-posn 2 -1) (cons (make-posn 1 -4) empty))  ;; expected