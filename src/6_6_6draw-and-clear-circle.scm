;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_6_6draw-and-clear-circle) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
; circle is a structure representing a colored circle in space: 
; (make-circle center radius color) 
; where center is a posn, radius is a number and color is a symbol

;; Template:
;; (define (fun-for-circle a-circle) 
;; ... (circle-center a-circle) ...
;; ... (circle-radius a-circle) ...
;; ... (circle-color a-circle) ...)

(define-struct circle (center radius color))

;; Contract: clear-a-circle :  circle  ->  boolean
;; Purpose: to clear a circle on a canvas
(define (clear-a-circle a-circle)
  (draw-solid-disk (circle-center a-circle) (circle-radius a-circle) 'white))

;; Contract: draw-a-circle :  circle  ->  boolean
;; Purpose: to draw a circle on a canvas
(define (draw-a-circle a-circle)
  (draw-circle (circle-center a-circle) (circle-radius a-circle) (circle-color a-circle)))

;; Contract: translate-circle :  circle  number ->  circle
;; Purpose: moves the position of a circle delta to the right where delta is a number of pixels
(define (translate-circle a-circle delta)
  (make-circle (translate-posn (circle-center a-circle) delta)
               (circle-radius a-circle)
               (circle-color a-circle)))

;; Contract: translate-circle :  posn  number ->  posn
;; Purpose: moves a position delta to the right where delta is a number of pixels
(define (translate-posn a-posn delta)
  (make-posn  (+ (posn-x a-posn) delta)
               (posn-y a-posn)))

;; Contract: draw-and-clear-circle :  circle  ->  boolean
;; Purpose: draws a circle then after a short period clears it
(define (draw-and-clear-circle a-circle)
  (and
   (draw-a-circle a-circle)
   (sleep-for-a-while 1)
   (clear-a-circle a-circle)))

;; move-circle : number circle  ->  circle
;; to draw and clear a circle, translate it by delta pixels
(define (move-circle delta a-circle)
  (cond
    [(draw-and-clear-circle a-circle) (translate-circle a-circle delta)]
    [else a-circle]))

;; test
(start 300 300)
(define a-circle (make-circle (make-posn 50 50) 25 'red))
(draw-and-clear-circle a-circle)
(stop)

(start 200 100)
(draw-a-circle 
  (move-circle 10
    (move-circle 10
      (move-circle 10
	(move-circle 10 a-circle)))))
