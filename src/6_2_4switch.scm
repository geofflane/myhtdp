;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_2_4switch) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define WIDTH 50)
(define HEIGHT 160)
(define BULB-RADIUS 20)
(define BULB-DISTANCE 10)

;; the positions of the bulbs 
(define X-BULBS (quotient WIDTH 2))
(define Y-RED (+ BULB-DISTANCE BULB-RADIUS))
(define Y-YELLOW (+ Y-RED BULB-DISTANCE (* 2 BULB-RADIUS)))
(define Y-GREEN (+ Y-YELLOW BULB-DISTANCE (* 2 BULB-RADIUS)))

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

;; draw-bulb : symbol  ->  symbol
;; turns on one of the bulbs
(define (draw-bulb color)
  (cond
    [(symbol=? 'red color) (redraw-color Y-RED 'red)]
    [(symbol=? 'yellow color) (redraw-color Y-YELLOW 'yellow)]
    [(symbol=? 'green color) (redraw-color Y-GREEN 'green)]))

(define (redraw-color circle color)
  (draw-solid-disk (make-posn X-BULBS circle) BULB-RADIUS color))

(define (switch clear-color new-color)
  (and (clear-bulb clear-color)
       (draw-bulb new-color)))

;; draw the light with the red bulb turned on
(start WIDTH HEIGHT)

(draw-bulb 'red)
(clear-bulb 'yellow)
(clear-bulb 'green)

