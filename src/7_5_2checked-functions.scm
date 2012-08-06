;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7_5_2checked-functions) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; checked-profit : Scheme-value  ->  number
;; to compute the profit of a movie showing where ticket-price
;; is a positive number
(define (checked-profit ticket-price)
   (cond
    [(and (number? v) (< 0 v)) (profit ticket-price)]
    [else (error 'checked-profit "positive number expected")]))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

;; checked-is-between-5-6? : Scheme-value  ->  boolean
;; to determine whether n is a number between 5 and 6 (exclusive)
(define (checked-is-between-5-6? n)
   (cond
    [(number? n) (is-between-5-6? n)]
    [else (error 'checked-is-between-5-6? "number expected")]))

(define (is-between-5-6? n)
  (and (< 5 n) (< n 6)))

;; checked-reply : Scheme-value  ->  symbol
;; get the response for s where s is a symbol
(define (checked-reply s)
   (cond
    [(symbol? s) (checked-reply s)]
    [else (error 'checked-reply "symbol expected")]))

(define (reply s)
  (cond
    [(symbol=? s 'GoodMorning) 'Hi]
    [(symbol=? s 'HowAreYou?) 'Fine]
    [(symbol=? s 'GoodAfternoon) 'INeedANap]
    [(symbol=? s 'GoodEvening) 'BoyAmITired]))

;; checked-distance-to-0 : Scheme-value  ->  number
;; find the distance to the 0,0 position where a-posn is a posn structure
(define (checked-distance-to-0 a-posn)
   (cond
    [(posn? a-posn) (distance-to-0 a-posn)]
    [else (error 'checked-distance-to-0 "posn structure expected")]))

(define (distance-to-0 a-posn)
  (sqrt
    (+ (sqr (posn-x a-posn))
       (sqr (posn-y a-posn)))))

;; checked-perimeter : Scheme-value  ->  number
;; find the perimiter of a shape
(define (checked-perimiter a-shape)
   (cond
    [(circle? a-shape) (perimeter a-shape)]
    [(square? a-shape) (perimeter a-shape)]
    [else (error 'checked-perimiter "shape structure expected")]))

;; perimeter : shape  ->  number
;; to compute the perimeter of a-shape
(define (perimeter a-shape)
  (cond
    [(circle? a-shape)
     (perimeter-circle a-shape)]
    [(square? a-shape)
     (perimeter-square a-shape)]))


(define (revenue ticket-price)
  (*  (attendees ticket-price) ticket-price))

(define (cost ticket-price)
  (+ 180 
     (* .04 (attendees ticket-price))))

(define (attendees ticket-price)
  (+ 120
     (* (/ 15 .10) (- 5.00 ticket-price))))


;; perimeter-circle : circle  ->  number
;; to compute the perimeter of a-circle
(define (perimeter-circle a-circle)
  (* (* 2 (circle-radius a-circle)) pi))

;; perimeter-square : square  ->  number
;; to compute the perimeter of a-square
(define (perimeter-square a-square)
  (* (square-length a-square) 4))