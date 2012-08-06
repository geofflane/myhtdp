;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 16_3_3du-dir) (read-case-sensitive #t) (teachpacks ((lib "dir.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "dir.ss" "teachpack" "htdp")))))

;; du-dir: dir -> number
;; total the size of all the files in this dir and all sub-dirs
(define (du-dir a-dir)
  (cond
    [(empty? a-dir) 0]
    [else (+ (total-sub-dirs (dir-dirs a-dir)) (total-files (dir-files a-dir)))]))

;; total-sub-dirs: list-of-directories -> number
;; total the size of the files in a list of directories and any of their sub directories
(define (total-sub-dirs lod)
  (cond
    [(empty? lod) 0]
    [(empty? (first lod)) (total-sub-dirs (rest lod))]
    [else (+
           (du-dir (first lod))
           (total-sub-dirs (rest lod)))]))

;; total-files: list-of-files -> number
;; total the size of all the files in the list
(define (total-files files)
  (cond
    [(empty? files) 0]
    [else (+ (file-size (first files)) (total-files (rest files)))]))

;; Tests
(define fs (make-dir 'TS
          (list 
           (make-dir 'Text empty (list (make-file 'part1 10 empty) (make-file 'part2 10 empty) (make-file 'part3 10 empty)))
           (make-dir 'Libs (list
                            (make-dir 'Code empty (list (make-file 'hang 10 empty) (make-file 'draw 10 empty)))
                            (make-dir 'Docs empty (list (make-file 'read 10 empty)))) empty))
          (list (make-file 'read 10 empty))))

(check-expect (du-dir empty) 0)
(check-expect (du-dir fs) 70)


(du-dir (create-dir "/Users/geoff/Development/htdp"))