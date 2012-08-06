;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_6_12move_rectangle) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; rectangle is a structure representing a colored rectangle in space: 
; (make-rectangle upper-left width height color) 
; where upper-left is a posn, width and height are numbers and color is a symbol

;; Template:
;; (define (fun-for-rectangle a-rectangle) 
;; ... (rectangle-upper-left a-rectangle) ...
;; ... (rectangle-width a-rectangle) ...
;; ... (rectangle-height a-rectangle) ...
;; ... (rectangle-color a-rectangle) ...)

(define-struct rectangle (upper-left width height color))

;; Contract: draw-a-rectangle :  rectangle  ->  boolean
;; Purpose: to draw a solid rectangle on a canvas
(define (draw-a-rectangle a-rectangle)
  (draw-solid-rect (rectangle-upper-left a-rectangle)
                   (rectangle-width a-rectangle)
                   (rectangle-height a-rectangle)
                   (rectangle-color a-rectangle)))

;; Contract: clear-a-rectangle :  rectangle  ->  boolean
;; Purpose: to clear a rectangle on a canvas
(define (clear-a-rectangle a-rectangle)
  (draw-solid-rect (rectangle-upper-left a-rectangle)
                   (rectangle-width a-rectangle)
                   (rectangle-height a-rectangle)
                   'white))

;; Contract: translate-rectangle :  rectangle  number ->  rectangle
;; Purpose: moves the position of a circle delta to the right where delta is a number of pixels
(define (translate-rectangle a-rectangle delta)
  (make-rectangle (translate-posn (rectangle-upper-left a-rectangle) delta)
                  (rectangle-width a-rectangle)
                  (rectangle-height a-rectangle)
                  (rectangle-color a-rectangle)))

;; Contract: translate-circle :  posn  number ->  posn
;; Purpose: moves a position delta to the right where delta is a number of pixels
(define (translate-posn a-posn delta)
  (make-posn  (+ (posn-x a-posn) delta)
               (posn-y a-posn)))

;; Contract: draw-and-clear-rectangle :  rectangle  ->  boolean
;; Purpose: draws a rectangle then after a short period clears it
(define (draw-and-clear-rectangle a-rectangle)
  (and
   (draw-a-rectangle a-rectangle)
   (sleep-for-a-while 1)
   (clear-a-rectangle a-rectangle)))

;; move-rectangle : number rectangle  ->  rectangle
;; to draw and clear a rectangle, translate it by delta pixels
(define (move-rectangle delta a-rectangle)
  (cond
    [(draw-and-clear-rectangle a-rectangle) 
     (translate-rectangle a-rectangle delta)]
    [else a-rectangle]))


;; test
(define a-rectangle (make-rectangle (make-posn 10 10) 50 50 'red))
(start 200 100)
(draw-a-rectangle 
  (move-rectangle 10
    (move-rectangle 10
      (move-rectangle 10
	(move-rectangle 10 a-rectangle)))))
