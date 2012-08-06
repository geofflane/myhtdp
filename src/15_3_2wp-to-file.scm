;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 15_3_2wp-to-file) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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

;; wp-to-file: Web-page -> list-of-symbols
;; collect all of the symbols in a-wp and any headers of sub-documents in a-wp's  body
(define (wp-to-file a-wp)
  (cond
    [(empty? (wp-body a-wp)) empty]
    [else (append (body-words (wp-body a-wp)) (body-headers (wp-body a-wp)))]))

;; body-words: Web-document -> list-of-symbols
;; collect all of the symbols in a Web-document into a list
(define (body-words a-doc)
  (cond
    [(empty? a-doc) empty]
    [(symbol? (first a-doc)) (cons (first a-doc) (body-words (rest a-doc)))]
    [else (body-words (rest a-doc))]))

;; body-headers: Web-document -> list-of-symbols
;; collect the headers of sub-documents
(define (body-headers a-wp)
  (cond
    [(empty? a-wp) empty]
    [(not (symbol? (first a-wp))) (cons (wp-header (first a-wp)) (body-headers (rest a-wp)))]
    [else (body-headers (rest a-wp))]))

;; Tests
(define empty-page (make-wp 'header empty))
(define plain-page (make-wp 'header '(foo bar baz)))
(define nested-page (make-wp 'header (list 'foo 'bar 'baz plain-page plain-page)))
 
(check-expect (wp-to-file empty-page) empty)
(check-expect (wp-to-file plain-page) '(foo bar baz))
(check-expect (wp-to-file nested-page) (list 'foo 'bar 'baz 'header 'header))