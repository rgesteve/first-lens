{-# LANGUAGE TemplateHaskell #-}

module Main where

import Lens.Micro
import Lens.Micro.TH
import Lens.Micro.Mtl -- for `view` for now (could be using `Lens.Micro.Extras` instead)

data Atom = Atom { _element :: String, _point :: Point } deriving (Show)
data Point = Point { _x :: Double, _y :: Double } deriving (Show)
data Molecule = Molecule { _atoms :: [Atom] } deriving (Show)

makeLenses ''Atom
makeLenses ''Point
makeLenses ''Molecule

atom = Atom { _element = "C", _point = Point { _x = 1.0, _y = 2.0 } }
atom1 = Atom { _element = "C", _point = Point { _x = 1.0, _y = 2.0 } }
atom2 = Atom { _element = "O", _point = Point { _x = 3.0, _y = 4.0 } }
molecule = Molecule { _atoms = [atom1, atom2] }

main :: IO ()
main = do
  -- let atom = Atom { _element = "C", _point = Point { _x = 1.0, _y = 2.0 } }
  --putStrLn "hello atom " ++ ( atom ^. point . x )
  putStrLn "hello atom " 
  -- putStrLn ( atom ^. point . x )
  -- toListOf (atoms . folded . point ) molecule
  putStrLn ( atom ^. element )
  putStrLn ( view element atom)
