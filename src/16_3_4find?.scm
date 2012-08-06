;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 16_3_4find?) (read-case-sensitive #t) (teachpacks ((lib "dir.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "dir.ss" "teachpack" "htdp")))))

;; find?: dir symbol -> boolean
;; find if find is the name of a file in dir or any of dir's sub directories
(define (find? a-dir find)
  (cond
    [(empty? a-dir) false]
    [else (or (find-files? (dir-files a-dir) find) (find-sub-dirs? (dir-dirs a-dir) find))]))

;; find-sub-dirs?: list-of-directories find -> boolean
;; find if find is the name of a file in any of the dirs in lod or any sub directories
(define (find-sub-dirs? lod find)
  (cond
    [(empty? lod) false]
    [(empty? (first lod)) (find-sub-dirs? (rest lod) find)]
    [else (or
           (find-sub-dirs? (rest lod) find)
           (find? (first lod) find))]))

;; find-files?: list-of-files symbol -> boolean
;; does find match the name of any of the files
(define (find-files? files find)
  (cond
    [(empty? files) false]
    [(symbol=? find (file-name (first files))) true]
    [else (find-files? (rest files) find)]))

;; Tests
(define fs (make-dir 'TS
          (list 
           (make-dir 'Text empty (list (make-file 'part1 10 empty) (make-file 'part2 10 empty) (make-file 'part3 10 empty)))
           (make-dir 'Libs (list
                            (make-dir 'Code empty (list (make-file 'hang 10 empty) (make-file 'draw 10 empty)))
                            (make-dir 'Docs empty (list (make-file 'read 10 empty)))) empty))
          (list (make-file 'read 10 empty))))

(check-expect (find? empty 'foo) false)
(check-expect (find? fs 'foo) false)
(check-expect (find? fs 'read) true)
(check-expect (find? fs 'hang) true)
(check-expect (find? fs 'part3) true)

(check-expect (find? (create-dir "/Users/geoff/Development/htdp") '16_3_3du-dir.scm) true)