;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_4_1data_defs) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; A movie is a structure: (make-movie title producer) where title and producers are strings.
(define-struct movie (title producer))

; A boyfriend is a structure: (make-boyfriend name hair eyes phone) 
; where name is a string and hair, eyes, and phone are symbols
(define-struct boyfriend (name hair eyes phone))

; A cheerleader is a structure: (make-cheerleader name number) 
; where name is a string and number is a symbol
(define-struct cheerleader (name number))

; A CD is a structure: (make-CD artist title price) 
; where artist and title are strings and price is a number
(define-struct CD (artist title price))

; A sweater is a structure: (make-sweater material size producer) 
; where material size and producer are symbols
(define-struct sweater (material size producer))
