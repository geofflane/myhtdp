;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11_2_3apply-n) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; A shape is either
;; 1. a structure: (make-circle p r c)
;;    where p is a posn, r a number and c is a symbol;
;; 2. a structure: (make-rectangle p w h c)
;;    where p is a posn, h and w are numbers and c is a symbol.
(define-struct circle (center radius color))

(define-struct rectangle (upper-left width height color))

;; list-of-shapes is one of
;; 1. empty
;; 2. (cons s losh) where s is a shape and losh is a list-of-shapes


(define FACE (cons (make-circle (make-posn 50 50) 40 'red)
                   (cons (make-rectangle (make-posn 30 20) 5 5 'blue)
                         (cons (make-rectangle (make-posn 65 20) 5 5 'blue)
                               (cons (make-rectangle (make-posn 40 75) 20 10 'red)
                                     (cons (make-rectangle (make-posn 45 35) 10 30 'blue) empty))))))

;; draw-losh: list-of-shapes -> boolean
;; draw all of the shapes in losh on the screen
(define (draw-losh losh)
    (cond 
    [(empty? losh) true]
    [else (and
           (draw-a-shape (first losh))
           (draw-losh (rest losh)))]))

;; translate-losh: list-of-shapes delta -> list-of-shapes
;; move all of the shapes in losh delta pixels across the screen
(define (translate-losh losh delta)
    (cond 
    [(empty? losh) empty]
    [else (cons (translate-shape (first losh) delta) (translate-losh (rest losh) delta))]))

;; clear-losh: list-of-shapes -> boolean
;; clear all of the shapes in losh from the screen
(define (clear-losh losh)
    (cond 
    [(empty? losh) true]
    [else (and
           (clear-shape (first losh))
           (clear-losh (rest losh)))]))

;; draw-and-clear-picture:  list-of-shapes  ->  boolean
;; draws a picture then after a short period clears it
(define (draw-and-clear-picture losh)
  (and
   (draw-losh losh)
   (sleep-for-a-while 1)
   (clear-losh losh)))

;; move-picture: number picture -> picture
;; move a picture by delta number of pixels left and right on the screen
(define (move-picture delta losh)
  (cond 
    [(empty? losh) empty]
    [(and (draw-and-clear-picture losh)
           (sleep-for-a-while 0.1)) (translate-losh losh delta)]))

;; move-shape : number shape  ->  shape
;; to draw and clear a shape, translate it by delta pixels
(define (move-shape delta a-shape)
  (cond
    [(draw-and-clear-shape a-shape) 
     (translate-shape a-shape delta)]
    [else a-shape]))

;; draw-and-clear-shape :  shape  ->  boolean
;; draws a shape then after a short period clears it
(define (draw-and-clear-shape a-shape)
  (and
   (draw-a-shape a-shape)
   (sleep-for-a-while 0.1)
   (clear-shape a-shape)))

;; translate-shape :  shape  delta ->  shape
;; to move a shape delta pixels to the right
(define (translate-shape a-shape delta)
  (cond
     [(circle? a-shape) (translate-circle a-shape delta)]
     [(rectangle? a-shape) (translate-rectangle a-shape delta)]))

;; draw-a-shape :  shape  ->  boolean
;; to draw a shape on a canvas
(define (draw-a-shape a-shape)
  (cond
     [(circle? a-shape) (draw-a-circle a-shape)]
     [(rectangle? a-shape) (draw-a-rectangle a-shape)]))

;; clear-shape :  shape  ->  boolean
;; to clear a shape on a canvas
(define (clear-shape a-shape)
  (cond
     [(circle? a-shape) (clear-a-circle a-shape)]
     [(rectangle? a-shape) (clear-a-rectangle a-shape)]))

;; draw-a-circle :  circle  ->  boolean
;; to draw a circle on a canvas
(define (draw-a-circle a-circle)
  (draw-circle (circle-center a-circle) (circle-radius a-circle) (circle-color a-circle)))

;; draw-a-rectangle :  rectangle  ->  boolean
;; to draw a solid rectangle on a canvas
(define (draw-a-rectangle a-rectangle)
  (draw-solid-rect (rectangle-upper-left a-rectangle)
                   (rectangle-width a-rectangle)
                   (rectangle-height a-rectangle)
                   (rectangle-color a-rectangle)))

;; translate-circle :  circle  delta ->  a-circle
;; moves the position of a circle delta to the right where delta is a number of pixels
(define (translate-circle a-circle delta)
  (make-circle (translate-posn (circle-center a-circle) delta)
               (circle-radius a-circle)
               (circle-color a-circle)))

;; translate-rectangle :  rectangle  number ->  rectangle
;; moves the position of a circle delta to the right where delta is a number of pixels
(define (translate-rectangle a-rectangle delta)
  (make-rectangle (translate-posn (rectangle-upper-left a-rectangle) delta)
                  (rectangle-width a-rectangle)
                  (rectangle-height a-rectangle)
                  (rectangle-color a-rectangle)))

;; clear-a-circle :  a-circle  ->  boolean
;; to clear a circle on a canvas
(define (clear-a-circle a-circle)
  (draw-solid-disk (circle-center a-circle) (circle-radius a-circle) 'white))

;; clear-a-rectangle :  rectangle  ->  boolean
;; to clear a rectangle on a canvas
(define (clear-a-rectangle a-rectangle)
  (draw-solid-rect (rectangle-upper-left a-rectangle)
                   (rectangle-width a-rectangle)
                   (rectangle-height a-rectangle)
                   'white))

;; translate-circle :  posn  delta ->  a-posn
;; moves a position delta to the right where delta is a number of pixels
(define (translate-posn a-posn delta)
  (make-posn  (+ (posn-x a-posn) delta)
               (posn-y a-posn)))

;; apply-n: number -> boolean
;; move face n pixels across the screen one at a time
(define (apply-n n)
  (apply-n-to n FACE))

(define (apply-n-to n pic)
  (cond 
    [(zero? n) (draw-losh pic)]
    [else (apply-n-to (sub1 n) (move-picture 1 pic))]))


;; tests
(start 500 100)
(apply-n 100)

; (stop) 