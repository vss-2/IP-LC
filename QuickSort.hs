-- Famosa implementação econômica em 2 linhas
qsort [] = [] 
qsort (x:xs) = qsort [y | y <- xs, y < x] ++ [x] ++ qsort [y | y <- xs, y >= x]

-- Na primeira linha cria a estrutura de dados
-- Na segunda, executa qsort no range(x:xs), tal que, 
-- qsort printa primeiro os ys que são y < x,
-- depois printa x, depois os valores tal que y >= x.

-- Input:  qsort[5,4,3,2,1]
-- Output: [1,2,3,4,5]

-- Versão menos econômica e mais humana (usando filter)
quicksort [] = []
quicksort (pivo:xs) = (quicksort menores) ++ [p] ++ (quicksort maiores)
    where
        menores = filter (< pivo) xs
        maiores = filter (>= pivo) xs
        
-- Input:  qsort[10,9,8,7,6]
-- Output: [6,7,8,9,10]

-- O where classifica os padrões entre maiores e menores:
-- onde o conjunto dos menores que pivo é filtrado para "menores"
-- e o mesmo vale para o conjunto dos maiores.
