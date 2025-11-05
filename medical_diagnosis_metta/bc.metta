;; -------------------------------------------------------
;; bc.metta
;; Backward chaining engine for medical diagnosis
;; Produces proof objects for queries
;; -------------------------------------------------------

;; bc: KB -> DepthLimit -> QueryProp -> Proof(QueryProp)
(:> bc (-> KB DepthLimit Prop Proof))

;; Base case: depth = 0, cannot reason further
(= (bc $kb BaseCase $q) fail)

;; Recursive case: depth > 0
(= (bc $kb (Next $d) $q)
   (or
      ;; 1. Check if query is a fact in KB
      (let ((pf (lookup-proof $kb $q)))
        pf)

      ;; 2. Apply rules from rule base
      (match &rb (-> $p1 $p2 $c)
        (if (unify $c $q)
            (let* (
                   ;; recursively prove premise 1
                   ((: pf1 (Proof $p1)) (bc $kb $d $p1))
                   ;; recursively prove premise 2
                   ((: pf2 (Proof $p2)) (bc $kb $d $p2))
                  )
              ;; combine proofs using the rule's constructor
              (pf-rule pf1 pf2))))))
