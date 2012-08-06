;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_6_1circle) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; circle is a structure representing a colored circle in space: 
; (make-circle center radius color) 
; where center is a posn, radius is a number and color is a symbol

;; Template:
;; (define (fun-for-circle a-circle) 
;; ... (circle-center a-circle) ...
;; ... (circle-radius a-circle) ...
;; ... (circle-color a-circle) ...)

(define-struct circle (center radius color))