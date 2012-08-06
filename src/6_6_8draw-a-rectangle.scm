;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_6_8draw-a-rectangle) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
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

;; tests
(start 300 300)
(draw-a-rectangle (make-rectangle (make-posn 10 10) 50 50 'red))
