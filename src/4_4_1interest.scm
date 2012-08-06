;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4_4_1interest) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.ss" "teachpack" "htdp")))))
;; interest : number  ->  number
;; to determine the amount of interest for the given amount >= 0
(define (interest deposit-amount)
  (cond
    [(<= deposit-amount 1000) (* deposit-amount .04)]
    [(<= deposit-amount 5000) (* deposit-amount .045)]
    [else (* deposit-amount .05)]))

(= (interest 0) 0)
(= (interest 100) 4)
(= (interest 1000) 40)
(= (interest 5000) 225)
(= (interest 10000) 500)