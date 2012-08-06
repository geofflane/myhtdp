;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_6_11clear-a-rectangle) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
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

;; test
(start 300 300)
(define a-rectangle (make-rectangle (make-posn 50 50) 25 25 'red))
(draw-a-rectangle a-rectangle)
(clear-a-rectangle a-rectangle)
