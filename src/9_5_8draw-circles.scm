;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9_5_8draw-circles) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; draw-circles: posn list-of-numbers -> boolean
;; draws circles at posn p, each with a radius in a a-list-of-rs
(define (draw-circles p a-list-of-rs)
  (cond 
    [(empty? a-list-of-rs) false]
    [(draw-a-circle p (first a-list-of-rs)) (draw-circles p (rest a-list-of-rs))]))

;; draw-a-circle :  posn number  ->  boolean
;; draw a circle on a canvas at posn p with radius r
(define (draw-a-circle p r)
  (draw-circle p r 'black))


(define radii (cons 10 (cons 20 (cons 30 empty))))
(start 300 300)
(draw-circles (make-posn 150 150) radii)
(draw-circles (make-posn 140 140) radii)
(draw-circles (make-posn 160 160) radii)