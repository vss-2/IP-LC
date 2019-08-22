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

-----------------------------------------------------------
-- Defina as seguintes funções (Fatorial, 4 iguais e quantos iguais):
-- fat :: Int −> Int que calcula o fatorial de um inteiro dado
-- como argumento
-- all4Equal :: Int −> Int −> Int −> Int −> Bool que compara se
-- quatro valores inteiros são iguais
-- equalCount :: Int −> Int −> Int −> Int que retorna quantos
-- argumentos são iguais

fatorial :: Int -> Int
fatorial 0 = 1
fatorial 1 = 1
fatorial n = n * fatorial (n-1)

all4Equal :: Int -> Int -> Int -> Int -> Bool
all4Equal x y z w
  |((x == y) && (x == z) && (x == w) && (y == z) && (y == w) && (z == w)) = True
  |otherwise = False

equalCount :: Int -> Int -> Int -> Int
equalCount x y z
  |((x == y) && (x /= z) || (y == z) && (x /= z)) || (x == z) && (x /= y) = 2
  |(y == z) && (y == x) = 3
  |otherwise = 0


-----------------------------------------------------------

-- Uso de Where, Let In
somaQuadradoWhereSimples :: Int -> Int -> Int
somaQuadradoWhereSimples x y = qdx + qdy
  where
    qdx = x * x
    qdy = y * y
        
        
somaQuadradoWhereAvancado :: Int -> Int -> Int
somaQuadradoWhereAvancado x y = quad x + quad y   
  where 
    quad z = z * z


-- Como somar dois quadrados usando let 
-- para definir funções e chamando no in
somaQuadradoLetInt :: Int -> Int -> Int
somaQuadradoLetInt x y =
  let quadX = x * x 
      quadY = y * y 
  in quadX + quadY
