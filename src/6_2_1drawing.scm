;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_2_1drawing) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(start 300 300)

(draw-solid-line (make-posn 10 10) (make-posn 110 10) 'red)

(draw-solid-rect (make-posn 10 30) 100 50 'blue)

(draw-circle (make-posn 110 30) 30 'yellow)

(draw-solid-disk (make-posn 10 80) 50 'green)

; (stop)