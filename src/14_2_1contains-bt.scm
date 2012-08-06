;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 14_2_1contains-bt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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
;      ... (child-name a-node) ...
;      ... (child-ssn a-node) ...]))

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
(boolean=? false (contains-bt 1 false))
(boolean=? true (contains-bt 15 a))
(boolean=? true (contains-bt 24 a))
(boolean=? false (contains-bt 5 a))
(boolean=? true (contains-bt 15 b))
(boolean=? true (contains-bt 87 b))
(boolean=? false (contains-bt 5 b))