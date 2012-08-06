;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10_1_6names-robot) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; name-robot: list-of-symbols -> list-of-symbols
;; replaces robot toys with r2d2 toys in toy-list
(define (name-robot toy-list)
    (cond
    [(empty? toy-list) empty]
    [else 
     (cond
       [(symbol=? (first toy-list) 'robot) (cons 'r2d2 (name-robot (rest toy-list)))]
       [else (cons (first toy-list) (name-robot (rest toy-list)))])]))

(name-robot (cons 'robot (cons 'doll (cons 'dress empty))))
;; expected value: 
(cons 'r2d2 (cons 'doll (cons 'dress empty)))


;; name-robot: symbol symbol list-of-symbols -> list-of-symbols
;; replaces old toy name with new toy name in toy-list
(define (substitute new old toy-list)
    (cond
    [(empty? toy-list) empty]
    [else 
     (cond
       [(symbol=? (first toy-list) old) (cons new (substitute new old (rest toy-list)))]
       [else (cons (first toy-list) (substitute new old (rest toy-list)))])]))

(substitute 'Barbie 'doll (cons 'robot (cons 'doll (cons 'dress empty))))
;; expected value: 
(cons 'robot (cons 'Barbie (cons 'dress empty)))