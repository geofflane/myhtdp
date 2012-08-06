;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_6_9in_rectangle) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
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

;; Contract: in-rectangle? :  rectangle  posn ->  boolean
;; Purpose: to determine if a posn is within the bounds of a rectangle
(define (in-rectangle? a-rectangle posn)
  (and
   (between 
    (posn-x (rectangle-upper-left a-rectangle)) 
    (+ (posn-x (rectangle-upper-left a-rectangle)) (rectangle-width a-rectangle))
    (posn-x posn))
   (between 
    (posn-y (rectangle-upper-left a-rectangle)) 
    (+ (posn-y (rectangle-upper-left a-rectangle)) (rectangle-height a-rectangle))
    (posn-y posn))))

(define (between min max val)
  (and
   (<= min val)
   (>= max val)))

;; tests
(between 0 10 10)
(between 0 10 5)
(not (between 0 10 11))

(define a-rectangle (make-rectangle (make-posn 0 0) 25 25 'red))
(in-rectangle? a-rectangle (make-posn 25 25))
(in-rectangle? a-rectangle (make-posn 0 25))
(in-rectangle? a-rectangle (make-posn 10 10))
(not (in-rectangle? a-rectangle (make-posn 30 30)))
