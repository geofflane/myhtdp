;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_2_2clear_bulb) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define WIDTH 50)
(define HEIGHT 160)
(define BULB-RADIUS 20)
(define BULB-DISTANCE 10)

;; the positions of the bulbs 
(define X-BULBS (quotient WIDTH 2))
(define Y-RED (+ BULB-DISTANCE BULB-RADIUS))
(define Y-YELLOW (+ Y-RED BULB-DISTANCE (* 2 BULB-RADIUS)))
(define Y-GREEN (+ Y-YELLOW BULB-DISTANCE (* 2 BULB-RADIUS)))

;; draw the light with the red bulb turned on
(start WIDTH HEIGHT)
(draw-solid-disk (make-posn X-BULBS Y-RED) BULB-RADIUS 'red)
(draw-circle (make-posn X-BULBS Y-YELLOW) BULB-RADIUS 'yellow)
(draw-circle (make-posn X-BULBS Y-GREEN) BULB-RADIUS 'green)

;; clear-bulb : symbol  ->  symbol
;; turns off one of the bulbs
(define (clear-bulb color)
  (cond
    [(symbol=? 'red color) (redraw-clear Y-RED 'red)]
    [(symbol=? 'yellow color) (redraw-clear Y-YELLOW 'yellow)]
    [(symbol=? 'green color) (redraw-clear Y-GREEN 'green)]))

(define (redraw-clear circle color)
  (and (draw-solid-disk (make-posn X-BULBS circle) BULB-RADIUS 'white)
  (draw-circle (make-posn X-BULBS circle) BULB-RADIUS color)))
