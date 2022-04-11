(define (domain key_exchange)
   (:requirements :strips :typing)
   (:types agent
           information
           key
           publicKey
	   )
   (:predicates
        (has-key ?a - agent ?k)
        (has-PublicKey ?a - agent ?pubKey)
        (has-EncypedKey ?a - agent ?k ?pk  ?pubKey)
        (has-EncryptedInfo ?a - agent ?info ?k)
        (has-Info ?a - agent ?info)
        (link ?a1 ?a2 - agent)
   )
  
   (:action share
        :parameters (?a1 ?a2 - agent  ?info - key ?pk - agent ?k -publicKey)
        :precondition (
            and
                (link ?a1 ?a2)
                (or 
                    (has-EncryptedInfo ?a1 ?info ?k)
                    (has-EncypedKey ?a1 ?info ?pk ?k)
                )
        )
        :effect (
            and
                (when
                    (has-EncryptedInfo ?a1 ?info ?k)
                    (has-EncryptedInfo ?a2 ?info ?k)
                )
                (when
                    (has-EncypedKey ?a1 ?info ?pk ?k)
                    (has-EncypedKey ?a2 ?info ?pk ?k)
                )
        )
   )
   
   (:action encrypt
        :parameters (?a - agent ?info - Key ?k - publicKey)
        :precondition (
            or 
                (and
                    (has-key ?a ?k)
                    (has-Info ?a ?info)
                )
                (has-key ?a ?info)
        )
        
        :effect (
            and
                (when
                    (and
                        (has-key ?a ?k)
                    (has-Info ?a ?info)
                    )
                    (and (has-EncryptedInfo ?a ?info ?k)
                        (not(has-Info ?a ?info))
                        )
                    
                )
                (when
                    (has-key ?a ?info)
                    (has-EncypedKey ?a ?info ?a ?k)
                )
        )
   )

   (:action decrypt
        :parameters (?a - agent ?info -key ?pk - agent ?k - publicKey)
        :precondition (
            or 
                (and
                    (has-key ?a ?k)
                    (has-EncryptedInfo ?a ?info ?k)
                )
                (and
                    (has-PublicKey ?a ?k)
                    (has-EncypedKey ?a ?info ?pk ?k)
                )
        )
        :effect (
            and
                (when
                    (and
                        (has-key ?a ?k)
                        (has-EncryptedInfo ?a ?info ?k)
                    )
                    (has-Info ?a ?info)
                )
                (when
                    (and
                        (has-PublicKey ?a ?k)
                        (has-EncypedKey ?a ?info ?pk ?k)
                    )
                    (has-key ?a ?info)
                )
        )
   )
)
