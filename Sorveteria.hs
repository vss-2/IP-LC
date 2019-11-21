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

produtor :: Int -> MVar Int -> IO ()
produtor item fim = do
    fimAtual <- takeMVar fim
    atomically (do
        writeTVar item 30
    )

    putMVar fim (fimAtual-1)
    produtor item fim

consumidor :: Int -> Int -> Int -> MVar Int -> IO ()
consumidor aroma espessante lRMR fim = do
    direitoRMR <- takeMVar lRMR
    fimAtual   <- takeMVar fim

    atomically (do
        estoqueAromaAtual      <- readTVar aroma
        estoqueEspessanteAtual <- readTVar espessante    

        writeTVar aroma      (estoqueAromaAtual-1)
        writeTVar espessante (estoqueEspessanteAtual-1)
    )

    putMVar lRMR direitoRMR
    putMVar fim (fimAtual-1)
    consumidor aroma espessante lRMR fim

main :: IO ()
main = do
    qtdIng = 30
    aroma       <- atomically (newTVar qtdIng)
    espessante  <- atomically (newTVar qtdIng)

    qntExec = 20
    lockRMR <- newMVar 0
    qntExec = newMVar qntExec

    forkIO(produtor aroma lockRMR qtdExec)
    forkIO(produtor espessante lockRMR qtdExec)
    forkIO(consumidor aroma espessante lockRMR qtdExec)
    waitThreads fim
    return ()
