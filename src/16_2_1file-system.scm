;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 16_2_1file-system) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; A file is a symbol.

; A directory (short: dir) is either
; 1. empty;
; 2. (cons f d) where f is a file and d is a dir; or
; 3. (cons d1 d2) where d1 and d2 are dirs.


(list 
 (list 'part1 'part2 'part3) ; Text
 (list ; Libs
  (list 'hang 'draw) ; Code
  (list 'read!)) ; Docs
 'read!) 
       