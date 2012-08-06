;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10_1_3convertFC) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; convertFC : list-of-numbers  ->  list-of-numbers
;; to create a list of celsius temperaturs from a list of fahrenheit temperaturs (lot)
(define (convertFC lot)
   (cond
    [(empty? lot) empty]
    [else (cons (Fahrenheit->Celsius (first lot)) (convertFC (rest lot)))]))

(define (Fahrenheit->Celsius temp)
  (* (/ (- temp 32) 9) 5))

;; test
(= 0 (Fahrenheit->Celsius 32))    ;; 0
(= 100 (Fahrenheit->Celsius 212))   ;; 100

(define l (cons 32 (cons 212 empty)))
(= 0 (first (convertFC l)))
(= 100 (first (rest (convertFC l))))