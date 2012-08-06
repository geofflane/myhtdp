;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_5_2time) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; time is a structure representing the time since midnight: 
; (make-time hours minutes seconds) 
; where hours is a number between 0 and 23, minutes and seconds are numbers between 0 and 59
(define-struct time (hours minutes seconds))

;; Contract: time->seconds :  time  ->  number

;; Purpose: to calculate the number of seconds since midnight

;; Template:
;; (define (time-seconds a-time) 
;; ... (time-hours a-time) ...
;; ... (time-minutes a-time) ...
;; ... (time-seconds a-time) ...)
(define (time->seconds a-time)
  (+ (* (time-hours a-time) 60 60)
     (* (time-minutes a-time) 60)
     (time-seconds a-time)))

(= (time->seconds (make-time 12 30 2)) 45002)
(= (time->seconds (make-time 0 0 50)) 50)
(= (time->seconds (make-time 0 1 0)) 60)
