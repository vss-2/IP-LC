-- Slide de Introdução

-- Exercício
-- Defina uma função que, dado um valor inteiro s e um número de
-- semanas n, retorna quantas semanas de 0 a n tiveram vendas
-- iguais a s.

-- Input: totalVendas 4 2
-- Output: 5
-- Intput: totalVendas 3 2
-- Output: 4
-- Input: totalVendas 4 1
-- Output: 0

vendas 0 = 2
vendas 1 = 2
vendas 2 = 2
vendas 3 = 2
vendas 4 = 2 

eIgual :: Int -> Int -> Int
eIgual a b
  | (a == b) = 1
  | (a /= b) = 0

totalVendas :: Int -> Int -> Int
totalVendas n s
  | (n == 0) = eIgual (vendas n) s
  | otherwise = eIgual (vendas n) s + totalVendas (n-1) s
