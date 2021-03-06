
module Main where

import Control.Applicative ( (<$>) )
import Control.Monad (forM_)
import System.Console.CmdArgs
import Text.Printf

import BioInf.GenussFold



data Options
  = Nussinov
    { coopts :: Int
    }
  deriving (Show,Data,Typeable)

oNussinov = Nussinov
  { coopts = 1 &= help "number of co-optimal backtracking results"
  }

main :: IO ()
main = do
  o <- cmdArgs $ modes [oNussinov]
  case o of
    Nussinov{..} -> do
      ls <- lines <$> getContents
      forM_ ls $ \l -> do
        let (r,bs) = pknPairMax coopts l
        printf "%s   %d\n" l r
        forM_ bs $ \[b] -> printf "%s   %d\n" b r

