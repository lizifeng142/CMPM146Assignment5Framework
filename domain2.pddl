(define (domain rooms-2hands)
  (:requirements :adl :typing)
  (:types key item - holdable 
          holdable
          character room hand
         )

  (:predicates 
    (at ?c - character ?r - room)
    (connected ?a - room ?b - room)
    (in ?i - holdable ?r - room)
    (holds ?c - character ?h - hand ?i - holdable)
    (free-hand ?c - character ?h - hand)
    (locked-door ?from - room ?to - room)
    (is-key ?k - key ?from - room ?to - room)
  )

  (:action move
    :parameters (?who - character ?from - room ?to - room )
    :precondition (and (at ?who ?from) (connected ?from ?to))
    :effect (and (not (at ?who ?from))
                 (at ?who ?to))
  )

  (:action pick-up
    :parameters (?who - character ?h - hand ?at - room ?what - holdable)
    :precondition (and (free-hand ?who ?h)
                       (at ?who ?at)
                       (in ?what ?at))
    :effect (and (not (free-hand ?who ?h))
                 (not (in ?what ?at))
                 (holds ?who ?h ?what))
  )

  (:action drop
    :parameters (?who - character ?h - hand ?at - room ?what - holdable)
    :precondition (and (holds ?who ?h ?what)
                       (at ?who ?at))
    :effect (and (free-hand ?who ?h)
                 (in ?what ?at)
                 (not (holds ?who ?h ?what)))
  )

  (:action unlock
    :parameters (?who - character ?h - hand ?from - room ?to - room ?key - key)
    :precondition (and (locked-door ?from ?to)
                       (is-key ?key ?from ?to)
                       (holds ?who ?h ?key)
                       (at ?who ?from))
    :effect (and (not (holds ?who ?h ?key))
                 (free-hand ?who ?h)
                 (not (locked-door ?from ?to))
                 (not (locked-door ?to ?from))
                 (connected ?from ?to)
                 (connected ?to ?from))
  )
)
