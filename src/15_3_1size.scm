;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 15_3_1size) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct wp (header body))
;; A Web-page (short: WP) is a structure: (make-wp h p)
;; where h is a symbol and p is a (Web) document

;; A (Web) document is either
;; 1. empty,
;; 2. (cons s p)
;;    where s is a symbol and p is a document, or
;; 3. (cons w p)
;;    where w is a Web-page and p is a document

;; (define (fun-for-wp a-wp)
;;   ... (wp-header a-wp) ...
;;   ... (wp-body a-wp) ...)

;; (define (fun-for-doc a-doc)
;;   (cond
;;     [(empty? a-doc) ...]
;;     [else ... (fun-for-wp (first a-doc)) ... (fun-for-doc (rest a-doc))...]))

;; size: Web-page -> number
;; count the number of symbols in a-wp and all sub documents
(define (size a-wp)
  (cond
    [(empty? (wp-body a-wp)) 0]
    [else (size-doc (wp-body a-wp))]))

;; size-doc: a-doc -> number
;; count the number of symbols in a-doc and all sub-documents
(define (size-doc a-doc)
  (cond
    [(empty? a-doc) 0]
    [(symbol? (first a-doc)) (+ 1 (size-doc (rest a-doc)))]
    [else (+ (size (first a-doc)) (size-doc (rest a-doc)))]))

;; Tests
(define empty-page (make-wp 'header empty))
(define plain-page (make-wp 'header '(foo bar baz)))
(define nested-page (make-wp 'header (list 'foo 'bar 'baz plain-page plain-page)))
 
(check-expect (size empty-page) 0)
(check-expect (size plain-page) 3)
(check-expect (size nested-page) 9)