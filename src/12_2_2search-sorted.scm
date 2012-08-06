;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 12_2_2search-sorted) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; search-sorted : number list-of-numbers (sorted)  ->  boolean
;; searches alon (sorted) for a specific number n
(define (search-sorted n alon)
  (cond
    [(empty? alon) false]
    [(= (first alon) n) true]
    [(< (first alon) n) false]
    [else (search-sorted n (rest alon))]))

;; tests
(define test-list (cons 6 (cons 5 (cons 3 (cons 2 empty)))))
(boolean=? true (search-sorted 6 test-list))
(boolean=? true (search-sorted 5 test-list))
(boolean=? true (search-sorted 3 test-list))
(boolean=? true (search-sorted 2 test-list))

(boolean=? false (search-sorted 7 test-list))
(boolean=? false (search-sorted 1 test-list))
(boolean=? false (search-sorted 4 test-list))
