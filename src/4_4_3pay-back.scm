;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4_4_3pay-back) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.ss" "teachpack" "htdp")))))
(define BREAK1 500)
(define BREAK2 1500)
(define BREAK3 2500)

;; payback : number -> number
;; to determine the amount to payback to a creditcard client based on the amount they spend.
(define (pay-back charge-amount)
  (cond
    [(<= charge-amount BREAK1) (rate1 charge-amount)]
    [(<= charge-amount BREAK2) (rate2 charge-amount)]
    [(<= charge-amount BREAK3) (rate3 charge-amount)]
    [else (rate4 charge-amount)]
    ))

;; rate1: number -> number
;; calculation for people who spend <= BREAK1
(define (rate1 charge-amount)
  (* charge-amount .0025))

;; rate2: number -> number
;; calculation for people who spend <= BREAK2
(define (rate2 charge-amount)
  (+ (rate1 BREAK1)
     (* (- charge-amount BREAK1) .005)))

;; rate3: number -> number
;; calculation for people who spend <= BREAK3
(define (rate3 charge-amount)
    (+ (rate2 BREAK2)
     (* (- charge-amount BREAK2) .0075)))

;; rate1: number -> number
;; calculation for people who spend > BREAK3
(define (rate4 charge-amount)
  (+ (rate3 BREAK3)
     (* (- charge-amount BREAK3) .01)))

(= (pay-back 400) 1)
(= (pay-back 1400) 5.75)

(= (pay-back 2000) 10)
(= (pay-back 2500) 13.75)
(= (pay-back 2600) 14.75)
