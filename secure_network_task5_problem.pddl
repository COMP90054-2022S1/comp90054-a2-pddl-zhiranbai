(define (problem task5)
   (:domain secure_network)
   (:objects a1 a2 a3 - agent i - information k - key pk1 pk2 pk3 - publicKey)
   (:init 
        (link a1 a2)
        (link a2 a3)
        (has-key a1 k)
        (has-PublicKey a1 pk1)
        (has-PublicKey a2 pk2)
        (has-PublicKey a3 pk3)
        (has-Info a1 i)
   )

   (:goal (and 
            (has-Info a3 i)
            (not(has-Info a2 i))
        )
   )
)
