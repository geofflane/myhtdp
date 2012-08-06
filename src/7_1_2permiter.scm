;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7_1_2permiter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; square is a structure representing a square: 
; (make-square nw length) 
; where nw is a posn and length is a number
(define-struct square (nw length))

; circle is a structure representing a circle 
; (make-circle center radius) 
; where center is a posn and radius is a number
(define-struct circle (center radius))

(define (perimeter a-shape)
  (cond
    [(square? a-shape) (* (square-length a-shape) 4)]
    [(circle? a-shape) (* (* 2 (circle-radius a-shape)) pi)]))

;; tests
(= (perimeter (make-square (make-posn 20 20) 3)) 12)
(= (perimeter (make-square (make-posn 1 20) 3)) 12)
(= (perimeter (make-square (make-posn 1 20) 1)) 4)

(= (perimeter (make-circle (make-posn 1 20) 1)) (* 2 pi))
