;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7_2_1zoo) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Data Definition:
(define-struct circle (center radius))
(define-struct square (nw length))
;; A shape is either
;; 1. a structure: (make-circle p s)
;;    where p is a posn, s a number;
;; 2. a structure: (make-square p s)
;;    where p is a posn, s a number.

(define-struct spider (legs space-needed))
(define-struct elephant (space-needed))
(define-struct monkey (intelligence space-needed))
;; An animal is either
;; 1. a structure: (make-spider l s)
;;    where l is a number, s is a shape;
;; 2. a structure: (make-elephant s)
;;    s is a shape;
;; 3. a sructure: (make-monkey i s)
;;    i is a number, s is a shape

;; Template:
;; (define (f an-animal)
;;   (cond
;;     [(spider? an-animal)
;;     ... (spider-legs an-animal) ... (spider-space-needed an-animal) ...]
;;     [(elephant? an-animal)
;;     ... (elephant-space-needed an-animal) ...]
;;     [(monkey? an-animal)
;;     ... (monkey-intelligence an-animal) ... (monkey-space-needed an-animal) ...]))

;; fits : animal cage-area  ->  boolean
;; to determine if an animal will fit in a given cage-area
(define (fits an-animal cage-area)
   (cond
     [(spider? an-animal) 
      (>= (area (spider-space-needed an-animal)) cage-area)]
     [(elephant? an-animal) 
      (>= (area (elephant-space-needed an-animal)) cage-area)]
     [(monkey? an-animal)
      (>= (area (monkey-space-needed an-animal)) cage-area)]))

; Contract: area: shape -> number
; Purpose: calculate the area of a shape
(define (area a-shape)
  (cond
    [(square? a-shape) (sqr (square-length a-shape))]
    [(circle? a-shape) (* (sqr (circle-radius a-shape)) pi)]))

;; tests
(fits (make-spider 8 (make-circle (make-posn 0 0) 5)) 50)
(not (fits (make-spider 8 (make-circle (make-posn 0 0) 5)) 250))

(fits (make-elephant (make-square (make-posn 0 0) 5)) 24)
(not (fits (make-elephant (make-square (make-posn 0 0) 5)) 30))

(fits (make-monkey 80 (make-square (make-posn 0 0) 5)) 25)
(not (fits (make-monkey 80 (make-square (make-posn 0 0) 5)) 30))
