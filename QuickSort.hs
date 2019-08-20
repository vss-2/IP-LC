-- Famosa implementação em 2 linhas
qsort [] = [] 
qsort (x:xs) = qsort [y | y <- xs, y < x] ++ [x] ++ qsort [y | y <- xs, y >= x]

-- Na primeira linha cria a estrutura de dados
-- Na segunda, executa qsort no range(x:xs), tal que, 
-- qsort printa primeiro os ys que são y < x,
-- depois printa x, depois os valores tal que y >= x.

-- Input:  qsort[5,4,3,2,1]
-- Output: [1,2,3,4,5]
