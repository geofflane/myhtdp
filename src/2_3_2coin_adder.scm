;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2_3_2coin_adder) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.ss" "teachpack" "htdp")))))
(define (sum-coins pennies nickles dimes quarters)
  (+ (* pennies .01)
     (* nickles .05)
     (* dimes .10)
     (* quarters .25)
   ))

;; tests
(sum-coins 1 1 1 1)  ;; 0.41