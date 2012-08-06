;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9_1_1lists) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; 9.1.1
(cons 'Pluto 
      (cons 'Uranus 
            (cons 'Neptune 
                  (cons 'Jupiter 
                        (cons 'Saturn 
                              (cons 'Mars 
                                    (cons 'Earth 
                                          (cons 'Venus 
                                                (cons 'Mercury empty)))))))))
; [Pluto [Uranus [Neptune [Jupiter [Saturn [Mars [Earth [Venus [Mercury | Empty]]]]]]]]


(cons 'steak (cons 'pommes-frites 
                   (cons 'beans (cons 'bread (cons 'water 
                                                   (cons 'juice (cons 'brie-cheese 
                                                                      (cons 'ice-cream empty))))))))
; [steak [pommes-frites [beans [bread [water [juice [brie-cheese [ice-cream | empty]]]]]]]]

(cons 'red (cons 'yellow (cons 'blue empty)))
; [red [yellow [blue | empty]]]