;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3_1_1attendees) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.ss" "teachpack" "htdp")))))
;; $5 = 120 people
;; -$0.10 = + 15 people
;; -$1 = +150
;; $4 = 270
;; $3 = 420

;; Contract: attendees : number  ->  number
;; Purpose: to compute the number of people who will attend a movie based on the tick-price
;; Example: (attendees 3) should produce 420
(define (attendees ticket-price)
  (+ 120
     (* (/ 15 .10) (- 5.0 ticket-price))))

;; tests
(attendees 3)  ;; 420
