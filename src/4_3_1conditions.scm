;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4_3_1conditions) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.ss" "teachpack" "htdp")))))
; (cond
;   [(< n 10) 20]
;   [(> n 20) 0]
;   [else 1])

; legal
; each has one condition and one answer
                        	
; (cond
;  [(< n 10) 20]
;  [(and (> n 20) (<= n 30))]
;  [else 1])

; illegal
; (and (> n 20) (<= n 30)) - evaluates to a condition, but there is no answer

; (cond [(< n 10) 20]
;      [* 10 n]
;      [else 555]) ;  

; [* 10 n] - has no condition