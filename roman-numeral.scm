
(use srfi-1)
(use regex)

(define (number->roman
         number)
  (let ((rules '(
                 ("IIIII" "V")
                 ("IIII" "IV")
                 ("VV" "X")
                 ("VIV" "IX")
                 ("XXXXX" "L")
                 ("XXXX" "XL")
                 ("LL" "C")
                 ("LXL" "XC")
                 ("CCCCC" "D")
                 ("CCCC" "CD")
                 ("DD" "M")
                 ("DCD" "CM"))))
    (fold (lambda
              (rule results)
            (string-substitute (first rule)
                               (last rule)
                               results
                               'all))
          (make-string number #\I)
          rules)))

(print (number->roman 3999))
