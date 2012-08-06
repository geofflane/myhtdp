;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7_2_2fleet) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct bus (passengers price-per-ride mpg))
(define-struct limo (passengers mpg))
(define-struct car (passengers mpg))
(define-struct subway (passengers price-per-ride mpg))
;; A vehicle is either
;; 1. a structure: (make-bus pass ppr mpg)
;;    where pass, ppr and mpg are numbers
;; 2. a structure: (make-limo pass mpg)
;;    where pass and mpg are numbers
;; 3. a sructure: (make-car pass mpg)
;;    where pass and mpg are numbers
;; 4. a sructure: (make-subway pass ppr mpg)
;;    where pass, ppr and mpg are numbers

;; Template:
;; (define (f a-vehicle)
;;   (cond
;;     [(bus? a-vehicle)
;;     ... (bus-passengers a-vehicle) ... (bus-price-per-ride a-vehicle) ... (bus-mpg a-vehicle) ...]
;;     [(subway? a-vehicle)
;;     ... (subway-passengers a-vehicle) ... (subway-price-per-ride a-vehicle) ... (subway-mpg a-vehicle) ...]
;;     [(limo? a-vehicle)
;;     ... (limo-subway-passengers a-vehicle) ... (limo-mpg a-vehicle) ... ]
;;     [(car? a-vehicle)
;;     ... (car-passengers a-vehicle) ... (car-mpg a-vehicle) ... ]))
