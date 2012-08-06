;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_6_10translate-rectangle) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
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

;; tests
(define posn1 (make-posn 0 0))
(define posn2 (translate-posn posn1 10))

(= (posn-y posn2) 0)
(= (posn-x posn2) 10)
(= (posn-x (rectangle-upper-left 
            (translate-rectangle 
             (make-rectangle (make-posn 50 50) 10 10 'red) 10))) 60)

