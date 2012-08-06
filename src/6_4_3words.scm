;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_4_3words) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; three-letter-word is a structure: 
; (make-three-letter-word first second third) 
; where first, second and third are symbols representing lowercase letters 'a to 'z
(define-struct three-letter-word (first second third))