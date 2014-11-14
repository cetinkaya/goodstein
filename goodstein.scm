; 2014 - Ahmet Cetinkaya

(define (increase-base-aux number base i acc)
  (if (= number 0)
      acc
      (let ((coeff (remainder number base))
            (div (floor (/ number base))))
        (increase-base-aux div base (+ i 1) (+ acc (* coeff (expt (+ base 1) (increase-base-aux i base 0 0))))))))
       
(define (increase-base number base)
  (increase-base-aux number base 0 0))

(define (iterate number base)
  (- (increase-base number base) 1))

(define (goodstein-sequence initial-number initial-base)
  (if (= initial-number 0)
      (list 0)
      (cons initial-number (goodstein-sequence (iterate initial-number initial-base) (+ initial-base 1)))))
