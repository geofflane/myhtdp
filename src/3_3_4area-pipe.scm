;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3_3_4area-pipe) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.ss" "teachpack" "htdp")))))
;; Contract: area-pipe : number number number  ->  number

;; Purpose: to compute the area of a pipe whose inner radius is
;; inner-radius, whose length is length and whose wall thickness is thickness

;; Example: (area-pipe 1 10 1) should produce 207.24

(define PI 3.14)

(define (area-pipe inner-radius length thickness)
  (+ (area-cylinder (+ inner-radius thickness) length)  ;; outer area
     (area-cylinder inner-radius length)                ;; inner area
     (* (area-of-ring (+ inner-radius thickness) inner-radius) 2)))  ;; area of top and bottom rings

;; Contract: area-cylinder : number number  ->  number
(define (area-cylinder radius height)
  (* (circumference radius) height))

;; Contract: circumference : number  ->  number
(define (circumference radius)
  (* (* radius 2) PI))

;; Contract: area-of-ring : number number  ->  number
(define (area-of-ring outer inner) 
  (- (area-of-disk outer)
     (area-of-disk inner)))

;; Contract: area-of-disk number  ->  number
(define (area-of-disk radius)
  (* PI (* radius radius)))
