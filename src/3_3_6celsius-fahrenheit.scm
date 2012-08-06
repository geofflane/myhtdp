;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3_3_6celsius-fahrenheit) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.ss" "teachpack" "htdp")))))
(define (Fahrenheit->Celsius temp)
  (* (/ (- temp 32) 9) 5))

(define (Celsius->Fahrenheit temp)
  (+ (/ (* temp 9) 5) 32))

;; test
(Celsius->Fahrenheit 0)     ;; 32
(Celsius->Fahrenheit 100)   ;; 212

;; I : number  ->  number
;; to convert a Fahrenheit temperature to Celsius and back 
(define (I f)
  (Celsius->Fahrenheit (Fahrenheit->Celsius f)))

(I 32)

;; What does this suggest about the composition of the two functions?

;; They are inverse functions?
;; The function are fundamentally evaulated the same way you would do it by hand.