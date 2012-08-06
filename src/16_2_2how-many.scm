;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 16_2_2how-many) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; A file is a symbol.

; A directory (short: dir) is either
; 1. empty;
; 2. (cons f d) where f is a file and d is a dir; or
; 3. (cons d1 d2) where d1 and d2 are dirs.

;; how-many: directory -> number
;; count the number of files in the fs
(define (how-many fs)
  (cond
    [(empty? fs) 0]
    [(symbol? (first fs)) (+ 1 (how-many (rest fs)))]
    [else (+ (how-many (first fs)) (how-many (rest fs)))]))

;; Tests
(define fs (list 
            (list 'part1 'part2 'part3) ; Text
            (list ; Libs
             (list 'hang 'draw) ; Code
             (list 'read!)) ; Docs
            'read!))
(check-expect (how-many empty) 0)
(check-expect (how-many fs) 7)

       