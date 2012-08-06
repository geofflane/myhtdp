;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4_2_2intervals) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.ss" "teachpack" "htdp")))))
(define (in-interval-1? x)
  (and (< -3 x) (< x 0)))

; (-3,0)

(define (in-interval-2? x)
  (or (< x 1) (> x 2)))

; outside [1,2]

(define (in-interval-3? x)
  (not (and (<= 1 x) (<= x 5))))
; outside [1,5]

; 1. true
; 2. true
; 3. true

(in-interval-1? -2)
(in-interval-2? -2)
(in-interval-3? -2)