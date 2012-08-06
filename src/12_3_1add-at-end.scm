;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 12_3_1add-at-end) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
; A polygon is either
; 1. (cons p empty) where p is a posn, or
; 2. (cons p lop) where p is a posn structure and lop is a polygon.

;; add-at-end: posn polygon -> polygon
;; add the a-posn to the end of the polygon list to allow it to be properly drawn
(define (add-at-end a-posn a-poly)
  (cond
    [(empty? a-poly) (cons a-posn empty)]
    [else (cons (first a-poly) (add-at-end a-posn (rest a-poly)))]))

;; draw-polygon : polygon  ->  true
;; to draw the polygon specified by a-poly 
(define (draw-polygon a-poly)
  (connect-dots (add-at-end (first a-poly) a-poly)))

;; connect-dots : polygon  ->  true
;; to draw connections between the dots of a-poly
(define (connect-dots a-poly)
  (cond
    [(empty? (rest a-poly)) true]
    [else (and (draw-solid-line (first a-poly) (second a-poly) 'red)
               (connect-dots (rest a-poly)))]))

;; Tests
(add-at-end (make-posn 1 1) empty)
(cons (make-posn 1 1) empty)
(add-at-end (make-posn 1 1) (cons (make-posn 1 2) empty))
(cons (make-posn 1 2) (cons (make-posn 1 1) empty))

(start 200 200)
(draw-polygon (cons (make-posn 10 10)
  (cons (make-posn 60 60)
    (cons (make-posn 10 60)
      empty))))