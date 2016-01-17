module SillyTypes

record Peano where
  constructor MkPeano
  natRep : Nat
  {gt0 : natRep `GT` 0}
  
data PeanoFin : Peano -> Type where
  MkPeanoFin :
    {lessThanThis : Peano} ->
    (peanoNumber : Peano) ->
    {ltN : (natRep peanoNumber) `LT` (natRep lessThanThis)} ->
    PeanoFin lessThanThis
  
record NonEmptyString where
  constructor MkNonEmptyString
  strRep : String
  nonEmpty : length strRep `GT` 0

NumPlayers : Type
NumPlayers = Peano

NumDice : Type
NumDice = Peano

NumDieSides : Type
NumDieSides = Peano
