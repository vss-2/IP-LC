-- Código por https://github.com/rodrigoap2/Plc2/

module Main where
import Control.Concurrent
import Control.Concurrent.STM
import Control.Concurrent.MVar

type SemaforoBinario = TVar Bool

p :: SemaforoBinario -> STM ()
p s = do
  x <- readTVar s
  if((==) x True)
  then do writeTVar s False
  else do retry
  return ()

v :: SemaforoBinario -> STM ()
v s = do
  p <- readTVar s
  if((==) p False)
  then do writeTVar s True
  else return ()

main :: IO()
main = do
  return ()
