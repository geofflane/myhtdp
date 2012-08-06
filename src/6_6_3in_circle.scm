;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_6_3in_circle) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
; circle is a structure representing a colored circle in space: 
; (make-circle center radius color) 
; where center is a posn, radius is a number and color is a symbol

;; Template:
;; (define (fun-for-circle a-circle) 
;; ... (circle-center a-circle) ...
;; ... (circle-radius a-circle) ...
;; ... (circle-color a-circle) ...)

(define-struct circle (center radius color))

;; Contract: in_circle? :  a-circle  posn ->  boolean
;; Purpose: to determine if a posn is within the bounds of a circle
(define (in_circle? a-circle posn)
  (>= (circle-radius a-circle) (distance-from-point (circle-center a-circle) posn)))

(define (distance-from-point point-posn a-posn)
  (sqrt
    (+ (sqr 
        (abs 
         (- (posn-x point-posn) (posn-x a-posn))))
       (sqr 
        (abs 
         (- (posn-y point-posn) (posn-y a-posn)))))))

;; tests
(= (distance-from-point (make-posn 0 0) (make-posn 2 2)) (sqrt 8))
(= (distance-from-point (make-posn 10 10) (make-posn 8 8)) (sqrt 8))

(in_circle? (make-circle (make-posn 50 50) 25 'red) (make-posn 50 50))
(in_circle? (make-circle (make-posn 50 50) 25 'red) (make-posn 50 75))
(not (in_circle? (make-circle (make-posn 50 50) 25 'red) (make-posn 50 76)))

