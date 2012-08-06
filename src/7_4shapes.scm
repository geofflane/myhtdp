;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7_4shapes) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define-struct circle (center radius color))
;; A circle is a structure:
;;          (make-circle p s)
;;    where p is a posn, s a number;

(define-struct rectangle (upper-left width height color))
;; A square is a structure:
;;          (make-square p s)
;;    where p is a posn, s a number.

;; A shape is either
;; 1. a circle, or
;; 2. a square.

;; Template:
;; (define (f a-shape)
;;   (cond
;;     [(circle? a-shape)
;;     ... (circle-center a-shape) ... (circle-radius a-shape) ...(circle-color a-shape) ...]
;;     [(rectangle? a-shape)
;;     ... (rectangle-upper-left a-shape) ... (rectangle-width a-shape) ...
;;         (rectangle-height a-shape) ... (rectangle-color a-shape) ...)]))


;; Contract: draw-a-shape :  shape  ->  boolean
;; Purpose: to draw a shape on a canvas
(define (draw-a-shape a-shape)
  (cond
     [(circle? a-shape) (draw-a-circle a-shape)]
     [(rectangle? a-shape) (draw-a-rectangle a-shape)]))


;; Contract: translate-shape :  shape  delta ->  shape
;; Purpose: to move a shape delta pixels to the right
(define (translate-shape a-shape delta)
  (cond
     [(circle? a-shape) (translate-circle a-shape delta)]
     [(rectangle? a-shape) (translate-rectangle a-shape delta)]))

;; Contract: clear-shape :  shape  ->  boolean
;; Purpose: to clear a shape on a canvas
(define (clear-shape a-shape)
  (cond
     [(circle? a-shape) (clear-a-circle a-shape)]
     [(rectangle? a-shape) (clear-a-rectangle a-shape)]))

;; Contract: draw-and-clear-shape :  shape  ->  boolean
;; Purpose: draws a shape then after a short period clears it
(define (draw-and-clear-shape a-shape)
  (and
   (draw-a-shape a-shape)
   (sleep-for-a-while 1)
   (clear-shape a-shape)))

;; move-shape : number shape  ->  shape
;; to draw and clear a shape, translate it by delta pixels
(define (move-shape delta a-shape)
  (cond
    [(draw-and-clear-shape a-shape) 
     (translate-shape a-shape delta)]
    [else a-shape]))

;; Contract: draw-a-circle :  circle  ->  boolean
;; Purpose: to draw a circle on a canvas
(define (draw-a-circle a-circle)
  (draw-circle (circle-center a-circle) (circle-radius a-circle) (circle-color a-circle)))

;; Contract: draw-a-rectangle :  rectangle  ->  boolean
;; Purpose: to draw a solid rectangle on a canvas
(define (draw-a-rectangle a-rectangle)
  (draw-solid-rect (rectangle-upper-left a-rectangle)
                   (rectangle-width a-rectangle)
                   (rectangle-height a-rectangle)
                   (rectangle-color a-rectangle)))

;; Contract: translate-circle :  circle  delta ->  a-circle
;; Purpose: moves the position of a circle delta to the right where delta is a number of pixels
(define (translate-circle a-circle delta)
  (make-circle (translate-posn (circle-center a-circle) delta)
               (circle-radius a-circle)
               (circle-color a-circle)))

;; Contract: translate-rectangle :  rectangle  number ->  rectangle
;; Purpose: moves the position of a circle delta to the right where delta is a number of pixels
(define (translate-rectangle a-rectangle delta)
  (make-rectangle (translate-posn (rectangle-upper-left a-rectangle) delta)
                  (rectangle-width a-rectangle)
                  (rectangle-height a-rectangle)
                  (rectangle-color a-rectangle)))

;; Contract: clear-a-circle :  a-circle  ->  boolean
;; Purpose: to clear a circle on a canvas
(define (clear-a-circle a-circle)
  (draw-solid-disk (circle-center a-circle) (circle-radius a-circle) 'white))

;; Contract: clear-a-rectangle :  rectangle  ->  boolean
;; Purpose: to clear a rectangle on a canvas
(define (clear-a-rectangle a-rectangle)
  (draw-solid-rect (rectangle-upper-left a-rectangle)
                   (rectangle-width a-rectangle)
                   (rectangle-height a-rectangle)
                   'white))

;; Contract: translate-circle :  posn  delta ->  a-posn
;; Purpose: moves a position delta to the right where delta is a number of pixels
(define (translate-posn a-posn delta)
  (make-posn  (+ (posn-x a-posn) delta)
               (posn-y a-posn)))

;; tests
(define posn1 (make-posn 0 0))
(define posn2 (translate-posn posn1 10))

(= (posn-x (circle-center 
            (translate-shape 
             (make-circle (make-posn 50 50) 10 'red) 10))) 
   60)
(= (posn-x (rectangle-upper-left 
            (translate-shape 
             (make-rectangle (make-posn 50 50) 10 10 'red) 10))) 
   60)

; (define a-shape (make-circle (make-posn 50 50) 25 'red))
(define a-shape (make-rectangle (make-posn 50 50) 25 25 'red))
(start 200 100)
(draw-a-shape
  (move-shape 10
    (move-shape 10
      (move-shape 10
	(move-shape 10 a-shape)))))
