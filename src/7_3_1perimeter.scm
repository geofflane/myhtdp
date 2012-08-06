;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7_3_1perimeter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Data Definitions:
(define-struct circle (center radius))
;; A circle is a structure:
;;          (make-circle p s)
;;    where p is a posn, s a number;

(define-struct square (nw length))
;; A square is a structure:
;;          (make-square p s)
;;    where p is a posn, s a number.

(define-struct rectangle (nw width height))
;; A square is a structure:
;;          (make-rectangle p w h)
;;    where p is a posn, w and h are numbers.

;; A shape is either
;; 1. a circle,
;; 2. a square, or
;; 3. a rectangle.
;; Final Definition: 
;; perimeter : shape  ->  number
;; to compute the perimeter of a-shape
(define (perimeter2 a-shape)
  (cond
    [(circle? a-shape)
     (* (* 2 (circle-radius a-shape)) pi)]
    [(square? a-shape)
     (* (square-length a-shape) 4)]
    [(rectangle? a-shape)
     (+ (* (rectangle-width a-shape) 2)
        (* (rectangle-height a-shape) 2))]))
          	
;; Final Definitions: 
;; perimeter : shape  ->  number
;; to compute the perimeter of a-shape
(define (perimeter a-shape)
  (cond
    [(circle? a-shape)
     (perimeter-circle a-shape)]
    [(square? a-shape)
     (perimeter-square a-shape)]
    [(rectangle? a-shape)
     (perimeter-rectangle a-shape)]))

;; perimeter-circle : circle  ->  number
;; to compute the perimeter of a-circle
(define (perimeter-circle a-circle)
  (* (* 2 (circle-radius a-circle)) pi))

;; perimeter-square : square  ->  number
;; to compute the perimeter of a-square
(define (perimeter-square a-square)
  (* (square-length a-square) 4))

;; perimeter-rectangle : rectangle  ->  number
;; to compute the perimeter of a-rectangle
(define (perimeter-rectangle a-rectangle)
  (+ (* (rectangle-width a-rectangle) 2)
        (* (rectangle-height a-rectangle) 2)))

;; tests
(define a-rectangle (make-rectangle (make-posn 0 0) 10 5))
(= (perimeter a-rectangle) 30)
(= (perimeter a-rectangle) (perimeter2 a-rectangle))

(define a-square (make-square (make-posn 0 0) 10))
(= (perimeter a-square) 40)
(= (perimeter a-square) (perimeter2 a-square))

(define a-circle (make-circle (make-posn 0 0) 5))
(= (perimeter a-circle) (* 10 pi))
(= (perimeter a-circle) (perimeter2 a-circle))
