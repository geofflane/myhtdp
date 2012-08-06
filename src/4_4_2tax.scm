;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4_4_2tax) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.ss" "teachpack" "htdp")))))
(define MIN_PAY_GRADE 240)
(define MID_PAY_GRADE 480)

(define MID_RATE 0.15)
(define HIGH_RATE 0.28)

(define (tax gross-pay)
  (cond
    [(<= gross-pay MIN_PAY_GRADE) 0]
    [(<= gross-pay MID_PAY_GRADE) (mid-tax-rate gross-pay)]
    [else (high-tax-rate gross-pay)]))

(define (mid-tax-rate gross-pay)
  (* (- gross-pay MIN_PAY_GRADE) MID_RATE))

(define (high-tax-rate gross-pay)
  (+ (mid-tax-rate MID_PAY_GRADE)
     (* (- gross-pay MID_PAY_GRADE) HIGH_RATE)))

(define (net-pay gross-pay)
  (- gross-pay (tax gross-pay)))

(= (tax 100) 0)
(= (tax 240) 0)
(= (tax 480) 36)
(= (tax 500) 41.6)
