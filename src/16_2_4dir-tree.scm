;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 16_2_4dir-tree) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct dir (name content size system))

; A directory is a structure:
;   (make-dir name content size systetm) 
; where name is a symbol, content is a list-of-files-and-directories, 
; size is a number and system is a boolean.

; A list-of-files-and-directories (short: LOFD) is either
; 1. empty;
; 2. (cons f d) where f is a file and d is a LOFD; or
; 3. (cons d1 d2) where d1 is a dir and d2 is a LOFD.

(make-dir 'TS
          (list 'read
                (make-dir 'Text (list 'part1 'part2 'part3) 10 true)
                (make-dir 'Libs (list
                                 (make-dir 'Code (list 'hang 'draw) 10 true)
                                 (make-dir 'Docs empty 10 true)) 10 true))
          10 true)
