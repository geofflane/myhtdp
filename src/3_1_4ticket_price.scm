;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3_1_4ticket_price) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.ss" "teachpack" "htdp")))))
;; profit : number  ->  number
;; to compute the profit as the difference between revenue and costs
;; at some given ticket-price
(define (profit ticket-price)
  (- (revenue ticket-price) (cost ticket-price)))

;; revenue : number  ->  number
;; to compute the revenue, given ticket-price 
(define (revenue ticket-price)
  (* (attendees ticket-price) ticket-price))

;; cost : number  ->  number
;; to compute the costs, given ticket-price
(define (cost ticket-price)
  (* 1.50 (attendees ticket-price)))

;; attendees : number  ->  number
;; to compute the number of attendees, given ticket-price
(define (attendees ticket-price)
  (+ 120
     (* (/ 15 .10) (- 5.0 ticket-price))))

;; tests
(profit 1)   ;; -360
(profit 2)   ;; 285
(profit 3)   ;; 630
(profit 4)   ;; 675
(profit 5)   ;; 420
(profit 6)   ;; -135

;; How not to design a program 
(define (profit2 price)
  (- (* (+ 120
           (* (/ 15 .10)
              (- 5.00 price)))
        price)
     
     (* 1.5
        (+ 120
           (* (/ 15 .10)
              (- 5.00 price))))))

;; tests
(profit2 1)   ;; -360
(profit2 2)   ;; 285
(profit2 3)   ;; 630
(profit2 4)   ;; 675
(profit2 5)   ;; 420
(profit2 6)   ;; -135