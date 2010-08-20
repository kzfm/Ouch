{-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
    Property - a module to manage property data types

    Copyright (c) 2010 Orion D. Jankowski

    This file is part of Ouch, a chemical informatics toolkit
    written entirely in Haskell.

    Ouch is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Ouch is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Ouch.  If not, see <http://www.gnu.org/licenses/>.

-------------------------------------------------------------------------------
------------------------------------------------------------------------------}

module Ouch.Property.Property (
   Property(..)
 , Value(..)
   ) where


import Ouch.Structure.Molecule
import Data.Maybe
import Data.Set as Set
import Data.List as List
import Data.Map as Map


{------------------------------------------------------------------------------}

data Property = Property {value::Value
                        , key::String
                        , func::Maybe (Molecule -> Property)}


instance Ord Property where
    compare a b | (key a) >  (key b) = GT
                | (key a) <  (key b) = LT
                | (key a) == (key b) = EQ

instance Eq Property where
    a == b = (key a) == (key b)


instance Show Property where
  show a = (show $ key a) ++ ": " ++ (show $ value a)


data Value =
    IntegerValue    Integer
  | DoubleValue     Double
  | BoolValue       Bool
  | TupleArrayValue [(Double, Double)]
  deriving (Eq, Ord, Show)

