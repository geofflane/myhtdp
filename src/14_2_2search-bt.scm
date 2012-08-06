;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 14_2_2search-bt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct node (ssn name left right))
; A binary-tree (short: BT) is either
; 1. false; or
; 2. (make-node soc pn lft rgt)
;   where soc is a number, pn is a symbol, and lft and rgt are BTs.

;; fun-for-node : node  ->  ???
;(define (fun-for-node a-node)
;  (cond
;    [(empty? a-node) ...]
;    [else
;      ... (fun-for-node (node-left a-node)) ...
;      ... (fun-for-node (node-right a-node)) ...
;      ... (node-name a-node) ...
;      ... (node-ssn a-node) ...]))

;; search-bt: number node -> symbol
;; finds the (node-name a-node) value of a node where (= (node-ssn a-node) number)
;; or false if no node match is found
(define (search-bt number a-node)
  (cond
    [(and (boolean? a-node) (boolean=? false a-node)) false]
    [(= number (node-ssn a-node)) (node-name a-node)]
    [(contains-bt number (node-left a-node)) (search-bt number (node-left a-node))]
    [else (search-bt number (node-right a-node))]))

;; contains-bt: number node -> boolean
;; determines whether the tree contains a-node where (= (node-ssn a-node) number)
(define (contains-bt number a-node)
  (cond
    [(and (boolean? a-node) (boolean=? false a-node)) false]
    [else (or (= number (node-ssn a-node))
              (contains-bt number (node-left a-node))
              (contains-bt number (node-right a-node)))]))

(define a (make-node
            15
            'd 
            false
            (make-node 24 'i false false)))
  
(define b (make-node
           15
           'd
           (make-node 87 'h false false)
           false))
  
;; Tests
(boolean=? false (search-bt 1 false))
(symbol=? 'd (search-bt 15 a))
(symbol=? 'i (search-bt 24 a))
(boolean=? false (search-bt 5 a))
(symbol=? 'd (search-bt 15 b))
(symbol=? 'h (search-bt 87 b))
(boolean=? false (search-bt 5 b))