(:> bc (-> KB DepthLimit Prop Proof))

;; Base case: cannot reason further
(= (bc $kb 0 $q) fail)

;; Recursive case
(= (bc $kb (Next $d) $q)
   (or
      ;; 1. Check if query is a fact in KB
      (lookup-proof $kb $q)

      ;; 2. Apply rules from rule base
      (match &rb (-> $p1 $p2 $c)
        (when (unify $c $q)
          (let* ((pf1 (bc $kb $d $p1))
                 (pf2 (bc $kb $d $p2)))
            (pf-rule pf1 pf2))))))
