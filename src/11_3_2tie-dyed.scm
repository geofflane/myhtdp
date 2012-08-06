;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11_3_2tie-dyed) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))

;; tie-dyed: number -> list-of-numbers
;; create a list-of-numbers of n random numbers between 20 and 120
;;  [---------]
;; 20        120
(define (tie-dyed n)
  (cond
    [(zero? n) empty]
    [else (cons (+ (random 101) 20) (tie-dyed (sub1 n)))]))

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

;; tests
(= 0 (length (tie-dyed 0)))
(= 3 (length (tie-dyed 3)))
(= 10 (length (tie-dyed 10)))

(start 300 300)
(draw-circles (make-posn 150 150) (tie-dyed 25))