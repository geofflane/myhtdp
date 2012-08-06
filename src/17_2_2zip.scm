;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 17_2_2zip) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct phone-record (name number))

; A phone-record is a structure:
;   (make-phone-record name number) 
; where name and number are symbols.

; A list-of-phone-records is either
; 1. empty or
; 2. (cons (make-phone-record a b) lopr) where lopr is a list-of-phone-records.

; zip: list-of-symbols list-of-symbols -> list-of-phone-records
; cobines a list of names and a list of phone numbers into a list-of-phone-records
(define (zip lon lop)
  (cond
    [(empty? lon) empty]
    [else (cons (make-phone-record (first lon) (first lop)) (zip (rest lon) (rest lop)))]))

;; Tests
(define names '(Adam Eve))
(define phones '(1234567 2345678))

(check-expect (zip empty empty) empty)
(check-expect (zip names phones) (list (make-phone-record 'Adam '1234567) (make-phone-record 'Eve '2345678)))
