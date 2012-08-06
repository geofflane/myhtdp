;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 12_3_2connect-dots) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
; A polygon is either
; 1. (cons p empty) where p is a posn, or
; 2. (cons p lop) where p is a posn structure and lop is a polygon.

;; draw-polygon : polygon  ->  true
;; to draw the polygon specified by a-poly 
(define (draw-polygon a-poly)
  (connect-dots a-poly (first a-poly)))

;; connect-dots : polygon posn ->  true
;; to draw connections between the dots of a-poly
(define (connect-dots a-poly posn-end)
  (cond
    [(empty? (rest a-poly)) (draw-solid-line (first a-poly) posn-end 'red)]
    [else (and (draw-solid-line (first a-poly) (second a-poly) 'red)
               (connect-dots (rest a-poly) posn-end))]))

(start 200 200)
(draw-polygon (cons (make-posn 10 10)
  (cons (make-posn 60 60)
    (cons (make-posn 10 60)
      empty))))