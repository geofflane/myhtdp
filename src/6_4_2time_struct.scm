;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_4_2time_struct) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; time is a structure representing the time since midnight: 
; (make-time hours minutes seconds) 
; where hours is a number between 0 and 23, minutes and seconds are numbers between 0 and 59
(define-struct time (hours minutes seconds))