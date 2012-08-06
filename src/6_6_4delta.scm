;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_6_4delta) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
; circle is a structure representing a colored circle in space: 
; (make-circle center radius color) 
; where center is a posn, radius is a number and color is a symbol

;; Template:
;; (define (fun-for-circle a-circle) 
;; ... (circle-center a-circle) ...
;; ... (circle-radius a-circle) ...
;; ... (circle-color a-circle) ...)

(define-struct circle (center radius color))

;; Contract: translate-circle :  a-circle  delta ->  a-circle
;; Purpose: moves the position of a circle delta to the right where delta is a number of pixels
(define (translate-circle a-circle delta)
  (make-circle (translate-posn (circle-center a-circle) delta)
               (circle-radius a-circle)
               (circle-color a-circle)))

;; Contract: translate-circle :  a-posn  delta ->  a-posn
;; Purpose: moves a position delta to the right where delta is a number of pixels
(define (translate-posn a-posn delta)
  (make-posn  (+ (posn-x a-posn) delta)
               (posn-y a-posn)))

;; tests
(define posn1 (make-posn 0 0))
(define posn2 (translate-posn posn1 10))

(= (posn-y posn2) 0)
(= (posn-x posn2) 10)
(= (posn-x (circle-center (translate-circle (make-circle (make-posn 50 50) 10 'red) 10))) 60)
