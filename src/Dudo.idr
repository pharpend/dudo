module Dudo

import Data.Vect
import SillyTypes

data Die : NumDieSides -> Type where
  MkDie : 
    {dieNumSides : NumDieSides} -> 
    (dieConfiguration : PeanoFin dieNumSides) -> 
    Die numSides

data Player : NumDice -> NumDieSides -> Type where
  MkPlayer : 
    (name : NonEmptyString) ->
    {numDice : NumDice} ->
    (numDiceInPlay : Nat) ->
    (numDiceNotInPlay : Nat) ->
    {dice_consistent : (natRep numDice) = (numDiceInPlay + numDiceNotInPlay)} ->
    {dieSides : NumDieSides} ->
    (diceInPlay : Vect numDiceInPlay (Die dieSides)) ->
    (diceNotInPlay : Vect numDiceNotInPlay (Die dieSides)) ->
    Player numDice dieSides

data Table : NumPlayers -> NumDice -> NumDieSides -> Type where
  MkTable : 
    {tableNumPlayers : NumPlayers} ->
    {tableNumDicePerPlayer : NumDice} ->
    {tableNumDieSides : NumDieSides} ->
    (tablePlayers : Vect (natRep tableNumPlayers) 
                         (Player tableNumDicePerPlayer tableNumDieSides)) ->
    Table numPlayers numDice numDieSides
