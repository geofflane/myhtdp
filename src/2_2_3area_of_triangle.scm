;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2_2_3area_of_triangle) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.ss" "teachpack" "htdp")))))
(define (area-of-triangle side height)
  (/ (* side height) 2))

;; tests
(area-of-triangle 4 15)  ;; 30
(area-of-triangle 9 6)   ;; 27