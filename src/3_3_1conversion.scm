;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3_3_1conversion) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.ss" "teachpack" "htdp")))))
(define CmPerIn 2.54)
(define InPerFeet 12)
(define FeetPerYards 3)
(define YardsPerRod 5.5)
(define RodsPerFurlong 40)
(define FurlongsPerMile 8)

(define (inches->cm inches)
  (* inches CmPerIn))

(define (feet->inches feet)
  (* feet InPerFeet))

(define (yards->feet yards)
  (* yards FeetPerYards))

(define (rods->yards rods)
  (* rods YardsPerRod))

(define (furlongs->rods furlongs)
  (* furlongs RodsPerFurlong))

(define (miles->furlongs miles)
  (* miles FurlongsPerMile))

(define (feet->cm feet)
  (inches->cm (feet->inches feet)))

(define (yards->cm yards)
  (inches->cm (feet->inches (yards->feet yards))))

(define (rods->inches rods)
  (feet->inches (yards->feet (rods->yards rods))))

(define (miles->feet miles)
  (yards->feet (rods->yards (furlongs->rods (miles->furlongs miles)))))


;; test
(yards->feet 1)   ;; 3
(miles->feet 1)   ;; 5280

  