;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7_1_3area) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; a shape is either a circle or a square

; square is a structure representing a square: 
; (make-square nw length) 
; where nw is a posn and length is a number
(define-struct square (nw length))

; circle is a structure representing a circle 
; (make-circle center radius) 
; where center is a posn and radius is a number
(define-struct circle (center radius))

; Contract: area: shape -> number
; Purpose: calculate the area of a shape
(define (area a-shape)
  (cond
    [(square? a-shape) (sqr (square-length a-shape))]
    [(circle? a-shape) (* (sqr (circle-radius a-shape)) pi)]))

;; tests
(= (area (make-square (make-posn 20 20) 3)) 9)
(= (area (make-square (make-posn 1 20) 3)) 9)
(= (area (make-square (make-posn 1 20) 1)) 1)

(= (area (make-circle (make-posn 1 20) 1)) (* 1 pi))
(= (area (make-circle (make-posn 1 20) 2)) (* 4 pi))