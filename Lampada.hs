produtor :: MVar Int -> MVar Int -> MVar Int -> IO()
produtor bulbos soquetes embalagens = do
    -- Produz nas variáveis os 50 usando atomically
    atomically (do
        putMVar bulbos 50
        putMVar soquetes 50
        putMVar embalagens 50
    ) 
    putStrLn "Abastecido"
    -- Chama a si mesmo
    produtor bulbos soquetes embalagens
---------------------------------------------------------------------

consumidor :: MVar Int -> MVar Int -> MVar Int -> IO()
consumidor bulbos soquetes embalagens = do

    atomically (do
        -- Faz a leitura usando MVar
        qtdBulbosAtual      <- readMVar bulbos
        qtdSoquetesAtual    <- readMVar soquetes
        qtdEmbalagensAtual  <- readMVar embalagens

        -- Monta e embala uma lampada
        putMVar bulbos       (qtdBulbosAtual-1)
        putMVar soquetes     (qtdBulbosAtual-1)
        putMVar embalagens   (qtdBulbosAtual-1)
    )

    -- Se estiver sem nada chamo produtor
    -- (não sei se é a abordagem 100% correta)
    if(( qtdBulbosAtual - 1) == 0) produtor bulbos soquetes embalagens
    -- Chama a si mesmo
    consumidor bulbos soquetes embalagens
------------------------------------------------------------------

main :: IO()
main = do
    -- Criação de variáveis atômicas
    qtdItens = 50
    bulbos     <- atomically (newMVar qtdItens)
    soquetes   <- atomically (newMVar qtdItens)
    embalagens <- atomically (newMVar qtdItens)


    -- Crio um produtor e dois consumidores (montam)
    forkIO(produtor bulbos soquetes embalagens)
    forkIO(consumidor bulbos soquetes embalagens)
    forkIO(consumidor bulbos soquetes embalagens)
