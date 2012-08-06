;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11_3_5riot) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define ROWS 5)
(define COLS 5)
(define BALLOON_SIZE 3)
(define WIDTH 200)
(define HEIGHT 200)

;; riot: number -> boolean
;; draw a grid and a random number of n balloons over the grid
(define (riot n)
  (and (draw-grid WIDTH HEIGHT)
       (throw-balloons n)))

;; throw-balloons: number -> boolean
;; draw a series of n red dots to represent thrown balloons randomly spread over the screen
(define (throw-balloons n)
  (cond
    [(zero? n) true]
    [else (and (draw-solid-disk (make-posn (random (add1 WIDTH)) (random (add1 HEIGHT))) BALLOON_SIZE 'red)
               (throw-balloons (sub1 n)))]))

;; draw-grid: number number -> boolean
;; draw a grid over a field of the given width and height
(define (draw-grid width height)
  (and (draw-rows ROWS (/ height ROWS))
       (draw-cols COLS (/ width COLS))))

(define (draw-rows n row-height)
  (cond
    [(zero? n) true]
    [else (and (draw-solid-line 
                (make-posn 0 (* n row-height)) 
                (make-posn WIDTH (* n row-height)) 'black)
               (draw-rows (sub1 n) row-height))]))

(define (draw-cols n col-width)
  (cond
    [(zero? n) true]
    [else (and (draw-solid-line 
                (make-posn (* n col-width) 0) 
                (make-posn (* n col-width) HEIGHT) 'black)
               (draw-cols (sub1 n) col-width))]))

(start WIDTH HEIGHT)
(riot 25)