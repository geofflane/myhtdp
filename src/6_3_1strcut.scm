;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_3_1strcut) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct movie (title producer))
(define mv (make-movie 'Pi 'Someone))
(movie-title mv)
(movie-producer mv)

(define-struct boyfriend (name hair eyes phone))
(define bf (make-boyfriend "Tad Hamilton" 'brown 'brown '123-4567))
(boyfriend-name bf)
(boyfriend-hair bf)
(boyfriend-eyes bf)
(boyfriend-phone bf)

(define-struct cheerleader (name number))
(define ch (make-cheerleader "Chick" '555-1212))
(cheerleader-name ch)
(cheerleader-number ch)

(define-struct CD (artist title price))
(define cd (make-CD "The Haunted" "One Kill Wonder" 10.99))
(CD-artist cd)
(CD-title cd)
(CD-price cd)

(define-struct sweater (material size producer))
(define sw (make-sweater 'wool 'xl 'my_wife))
(sweater-material sw)
(sweater-size sw)
(sweater-producer sw)
