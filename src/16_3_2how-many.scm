;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 16_3_2how-many) (read-case-sensitive #t) (teachpacks ((lib "dir.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "dir.ss" "teachpack" "htdp")))))

;; how-many: dir -> number
;; count the number of files in the fs
(define (how-many a-dir)
  (cond
    [(empty? a-dir) 0]
    [else (+ (count-sub-dirs (dir-dirs a-dir)) (count-files (dir-files a-dir)))]))

;; count-sub-dirs: list-of-directories -> number
;; count the number of files in a list of directories and any of their sub directories
(define (count-sub-dirs lod)
  (cond
    [(empty? lod) 0]
    [(empty? (first lod)) (count-sub-dirs (rest lod))]
    [else (+
           (how-many (first lod))
           (count-sub-dirs (rest lod)))]))

(define (count-files files)
  (cond
    [(empty? files) 0]
    [else (+ 1 (count-files (rest files)))]))

;; Tests
(define fs (make-dir 'TS
          (list 
           (make-dir 'Text empty (list (make-file 'part1 0 empty) (make-file 'part2 0 empty) (make-file 'part3 0 empty)))
           (make-dir 'Libs (list
                            (make-dir 'Code empty (list (make-file 'hang 0 empty) (make-file 'draw 0 empty)))
                            (make-dir 'Docs empty (list (make-file 'read 0 empty)))) empty))
          (list (make-file 'read 0 empty))))

(check-expect (how-many empty) 0)
(check-expect (how-many fs) 7)

