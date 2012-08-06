;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_6_5clear-circle) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
; circle is a structure representing a colored circle in space: 
; (make-circle center radius color) 
; where center is a posn, radius is a number and color is a symbol

;; Template:
;; (define (fun-for-circle a-circle) 
;; ... (circle-center a-circle) ...
;; ... (circle-radius a-circle) ...
;; ... (circle-color a-circle) ...)

(define-struct circle (center radius color))

;; Contract: clear-a-circle :  a-circle  ->  boolean
;; Purpose: to clear a circle on a canvas
(define (clear-a-circle a-circle)
  (draw-solid-disk (circle-center a-circle) (circle-radius a-circle) 'white))

;; Contract: draw-a-circle :  a-circle  ->  boolean
;; Purpose: to draw a circle on a canvas
(define (draw-a-circle a-circle)
  (draw-circle (circle-center a-circle) (circle-radius a-circle) (circle-color a-circle)))

;; test
(start 300 300)
(define a-circle (make-circle (make-posn 50 50) 25 'red))
(draw-a-circle a-circle)
(clear-a-circle a-circle)
