;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_5_1templates) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Template:
;; (define (process-movie a-movie) 
;; ... (movie-title a-movie) ...
;; ... (movie-producer a-movie) ...)
(define-struct movie (title producer))

;; Template:
;; (define (breakup a-boyfriend) 
;; ... (boyfriend-name a-boyfriend) ...
;; ... (boyfriend-hair a-boyfriend) ...
;; ... (boyfriend-eyes a-boyfriend) ...
;; ... (boyfriend-phone a-boyfriend) ...)
(define-struct boyfriend (name hair eyes phone))

;; Template:
;; (define (process-cheerleader a-cheerleader) 
;; ... (cheerleader-title a-cheerleader) ...
;; ... (cheerleader-producer a-cheerleader) ...)
(define-struct cheerleader (name number))

;; Template:
;; (define (process-CD a-cd) 
;; ... (CD-artist a-cd) ...
;; ... (CD-title a-cd) ...
;; ... (CD-price a-cd) ...)
(define-struct CD (artist title price))

;; Template:
;; (define (process-sweater a-sweater) 
;; ... (sweater-material a-sweater) ...
;; ... (sweater-size a-sweater) ...
;; ... (sweater-producer a-sweater) ...)
(define-struct sweater (material size producer))