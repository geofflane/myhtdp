;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 16_3_1fs) (read-case-sensitive #t) (teachpacks ((lib "dir.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "dir.ss" "teachpack" "htdp")))))
(make-dir 'TS
          (list 
           (make-dir 'Text empty (list (make-file 'part1 0 empty) (make-file 'part2 0 empty) (make-file 'part3 0 empty)))
           (make-dir 'Libs (list
                            (make-dir 'Code empty (list (make-file 'hang 0 empty) (make-file 'draw 0 empty)))
                            (make-dir 'Docs empty empty)) empty))
          (list (make-file 'read 0 empty)))

(create-dir "/Users/geoff/Development/htdp")