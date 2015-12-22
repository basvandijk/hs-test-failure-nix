module Main ( main ) where

import Control.Monad
import System.Environment
import System.Directory
import Paths_myLib

main :: IO ()
main = do
  fp <- getDataFileName "Lenna.png"
  exists <- doesFileExist fp
  unless exists $
    error $ fp ++ " doesn't exist!"

  myLib_datadir <- getEnv "myLib_datadir"
  putStrLn $ "myLib_datadir = " ++ myLib_datadir
