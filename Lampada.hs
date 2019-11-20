-- Código por Lucas Mendonça (@lsm5)
import Control.Concurrent
import Control.Concurrent.MVar
import Control.Concurrent.STM

waitThreads :: MVar Int -> IO ()
waitThreads fim = do
    f <- takeMVar fim
    if (f > 0) then do
        putMVar fim f
        waitThreads fim
    else
        return ()

produtor :: Int -> Int -> Int -> MVar Int -> IO()
produtor bulbos soquetes embalagens fim = do
  fimAtual <- takeMVar fim
    -- Produz nas variáveis os 50 usando atomically
  atomically (do
    writeTVar bulbos 50
    writeTVar soquetes 50
    writeTVar embalagens 50
  )

    putStrLn "Abastecido"
    -- Chama a si mesmo
  putMVar fim (fimAtual-1)
  produtor bulbos soquetes embalagens fim
---------------------------------------------------------------------

consumidor :: Int -> Int -> Int -> MVar Int -> IO()
consumidor bulbos soquetes embalagens fim = do
  fimAtual <- takeMVar fim
  atomically (do
        -- Faz a leitura usando MVar
    qtdBulbosAtual      <- readTVar bulbos
    qtdSoquetesAtual    <- readTVar soquetes
    qtdEmbalagensAtual  <- readTVar embalagens

        -- Monta e embala uma lampada
    writeTVar bulbos (qtdBulbosAtual-1)
    writeTVar soquetes (qtdBulbosAtual-1)
    writeTVar embalagens (qtdBulbosAtual-1)
  )

    putMVar fim (fimAtual - 1)
    -- Chama a si mesmo
    consumidor bulbos soquetes embalagens fim
------------------------------------------------------------------

main :: IO()
main = do
    -- Criação de variáveis atômicas
  qtdItens = 50
  bulbos     <- atomically (newTVar qtdItens)
  soquetes   <- atomically (newTVar qtdItens)
  embalagens <- atomically (newTVar qtdItens)

  qntExec = 20
  qntExec = newMVar qntExec

    -- Crio um produtor e dois consumidores (montam)
  forkIO(produtor bulbos soquetes embalagens qntExec)
  forkIO(consumidor bulbos soquetes embalagens qntExec)
  forkIO(consumidor bulbos soquetes embalagens qntExec)
  waitThreads fim
  return ()
