;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4_3_3conditions) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.ss" "teachpack" "htdp")))))
(cond
  [(<= n 1000) (* .040 1000)]
  [(<= n 5000) (+ (* 1000 .040) 
		  (* (- n 1000) .045))]
  [else (+ (* 1000 .040) 
	   (* 4000 .045)
	   (* (- n 10000) .055))])

; when n is (a) 500, (b) 2800, and (c) 15000? 
; a) 40
; b) 121
; c) 495
