;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10_1_5eliminate-exp) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; eliminate-exp: number list-of-numbers -> list-of-numbers
;; takes a list of toy prices, called lotp, and produces a list of all those 
;; prices in lotp that are below or equal to ua
(define (eliminate-exp ua lotp)
  (cond
    [(empty? lotp) empty]
    [else 
     (cond
       [(<= (first lotp) ua) (cons (first lotp) (eliminate-exp ua (rest lotp)))]
       [else (eliminate-exp ua (rest lotp))])]))

;; Tests
(eliminate-exp 1.0 (cons 2.95 (cons .95 (cons 1.0 (cons 5 empty)))))
;; expected value: 
(cons .95 (cons 1.0 empty))