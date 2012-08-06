;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11_3_1random-n-m) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; random-n-m : integer integer  ->  integer
;; calculate a random number between 0 (inclusive) and m-n (exclusive) and
;; adds that value with the value of n
;; [----------)     + n
;; 0        m - n 
;; Assume: n < m