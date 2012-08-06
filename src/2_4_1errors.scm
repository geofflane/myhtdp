;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2_4_1errors) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.ss" "teachpack" "htdp")))))
; (+ (10) 20)
;; function call: expected a defined name or a primitive operation name after an open parenthesis, but found a number
;; (10) primitive value is not a callable function or operation

; (10 + 20)
;; function call: expected a defined name or a primitive operation name after an open parenthesis, but found a number
;; first value needs to be an operation not a primitive value

; (+ +)
;; +: this primitive operator must be applied to arguments; expected an open parenthesis before the primitive operator name
;; + is a primitive operator as such it can't be an argument to a function