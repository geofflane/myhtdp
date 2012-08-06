;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2_2_1fahrenheit_celsius) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.ss" "teachpack" "htdp")))))
(define (Fahrenheit->Celsius temp)
  (* (/ (- temp 32) 9) 5))

;; test
(Fahrenheit->Celsius 32)    ;; 0
(Fahrenheit->Celsius 212)   ;; 100