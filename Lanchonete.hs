import Control.Concurrent
import Control.Concurrent.MVar
import Control.Concurrent.STM

-- A versão original, sem comentários é está na bolha: tiny.cc/bolha

-- MVar: 
-- Podem ser vazias, são usadas para implementar padrões sincronizados entre threads
-- a comunicação é "one-way" entre as mesmas, são mais rápidas que TVar, 
-- mas podem dar deadlock.
-- Se você for usar operações do tipo putMVar ou takeMVar,
-- diga no início (::) que a variável é do tipo MVar, detalhes:
-- http://hackage.haskell.org/package/base-4.12.0.0/docs/Control-Concurrent-MVar.html
-- Como esperado: putMVar altera (se estiver vazio) o valor de uma MVar, senão espera
-- e o takeMVar pega e tira o valor de uma MVar, se estiver vazio, espera

-- TVar: 
-- São variáveis de transição, mais lentas, mas mais seguras, não podem ser vazias
-- são compartilhadas entre threads e implementadas de forma atômica.
-- Se você for usar operações do tipo writeTVar ou readTVar,
-- diga no início (::) que a variável é do tipo TVar, detalhes:
-- http://hackage.haskell.org/package/stm-2.5.0.0/docs/Control-Concurrent-STM-TVar.html
-- Como esperado: writeTVar escreve o valor (só isso) na TVar
-- e o readTVar retorna o valor de uma TVar (só isso)

-- Sua função: verifica se após fim (modificado pelas threads) chegou a zero.
-- Encerra o loop caso sim, encerrando o main que encerra as threads
waitThreads :: MVar Int -> IO ()
waitThreads fim = do
    f <- takeMVar fim
    if (f > 0) then do
        putMVar fim f
        waitThreads fim
    else
        return ()


-- Isso é tipo classe, setta as quantidades fornecidas e se chama
produtor :: Int -> Int -> Int -> MVar Int -> IO ()
produtor pao carne tomate fim = do
    fimAtual <- takeMVar fim
    atomically (do
        writeTVar pao 30
        writeTVar carne 30
        writeTVar tomate 30
    )

    putMVar fim (fimAtual-1)
    produtor pao carne tomate fim

-- Isso é tipo classe, consome os produtos, e se chama de novo
consumidor :: Int -> Int -> Int -> MVar Int -> MVar Int -> IO ()
consumidor pao carne tomate faca fim = do
    -- Fim == quantida de execuções
    direitoFaca <- takeMVar faca
    fimAtual    <- takeMVar fim

    -- Para produzir um sanduíche, são gastos 1 de cada:
    -- Então faço a leitura do dado, e gasto, isso é tipo get() e set() em Java
    atomically (do
        estoquePaoAtual <- readTVar pao
        estoqueCarneAtual <- readTVar carne    
        estoqueTomateAtual <- readTVar tomate

        writeTVar pao (estoquePaoAtual-1)
        writeTVar carne (estoquePaoAtual-1)
        writeTVar tomate (estoquePaoAtual-1)
    )

    putMVar faca direitoFaca
    putMVar fim (fimAtual-1)
    consumidor pao carne tomate faca fim

main :: IO ()
main = do
    -- atomically() é usado para dizer que vamos usar STM
    -- Software Transction Memory, ou seja, estamos dizendo 
    -- que a variável será compartilhada pra threads
    
    -- Inicia estoque inicial dos ingredientes
    qtdIng = 30
    pao    <- atomically (newTVar qtdIng)
    carne  <- atomically (newTVar qtdIng)
    tomate <- atomically (newTVar qtdIng)

    -- Controla a concorrência 
    -- (quantidade de execuções e o objeto de disputa: faca)
    qntExec = 20
    lockFaca <- newMVar 0
    qntExec = newMVar qntExec

    -- A partir de agora, pode-se iniciar a execução

    -- forkIO seria tipo um new Thread + run(), criando a Thread e
    -- chamando o método com seus parâmetros, e executando
    -- Iniciando as threads: 1 produtora, 2 consumidoras
    forkIO(produtor pao carne tomate qtdExec)
    forkIO(consumidor pao carne tomate lockFaca qtdExec)
    forkIO(consumidor pao carne tomate lockFaca qtdExec)
    waitThreads fim
    return ()
    -- O main chamou as threads,
    -- elas executam waitThreads e depois o código acaba
