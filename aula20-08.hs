-- Construtor Polimórfico ":"

[5] == 5:[]              -- Isso é True
[4,5] == 4:(5:[])        -- Isso é True
[2,3,4,5] ==  2:3:4:5:[] -- Isso é True

-- Usamos (x:xs) para indicar (inicio:fim),
-- isso é muito usado na recursão.

-- Vamos supor que você queira somar 
-- todos os elementos de uma dada lista
-- Você deveria fazer:
-- 1. Definir o caso base
-- 2. Definir o caso recursivo

somaLista :: [Int] -> Int                 -- Dada input lista de ints, retorna um int
somaLista [] = 0                          -- Caso base (vazio)
somaLista (x:xs) = x + somaLista xs       -- Caso recursivo (soma atual + próximo)

-- Isso é equivalente a ser executado:

{- Para uma lista [1,2,3]:

= somaLista (1: (2: (3: []))) ....
= 1 + 2 + somaLista (3: [])....
= 1 + 2 + 3 somaLista []....
= 1 + 2 + 3 + 0
= 6

-}

-- Vamos supor que você queira
-- para cada valor de uma lista
-- multiplicar o mesmo por 2
-- e salvar numa lista.
-- O procedimento é o mesmo do caso acima:
-- 1. Definir o caso base
-- 2. Definir o caso recursivo

listaVezes2 :: [Int] -> [Int]
listaVezes2 [] = []                         -- Caso base
listaVezes2 (x:xs) = x*2 : listaVezes2 xs   -- Caso recursivo

-- Lembre-se a ordem dos termos importa

-- Vamos supor ainda, que dada uma lista
-- você quer saber se um elemento está 
-- presente na mesma

-- Observação, a letra a minúscula (ou qualquer outra)
-- é utilizada como "termo genérico" em Haskell

fazParte :: [Int] -> Int -> Bool
fazParte [] a = False                           -- Caso base (como vazio != a, para qualquer a, então é falso)
fazParte (x:xs) a = (x == a) || (fazParte xs a) -- Caso recursivo (a armazena o resultado de (x == a)? ou (próximo == a)?

-- Poderiamos fazer ainda, usando Guardas:
fazParte2 :: [Int] -> Int -> Bool
fazParte2 [] a = False
  fazParte2(x:xs) n
  | n == xs = True
  | n /= xs = False
  
-- Ou ainda, usando otherwise:
fazParte3 :: [Int] -> Int -> Bool
fazParte3 [] n = False 
  fazParte3(x:xs) n
  | n == xs = True
  | otherwise = fazParte3 xs n
  
  
-- Vamos supor que você queira filtrar
-- os valores números de uma dada 
-- cadeia de caracteres (String):
  
verificaDigito :: Char -> Bool
verificaDigito ch = ('0' <= ch) && (ch <= '9')    -- Se o char não for entre 0..9, é letra, então retorna False
-- definindo conjunto de números de 0 a 9

digits :: String -> String
digits [] = []
digits (x:xs)
  | verificaDigito x = x : digits xs    -- Se digito X for número, armazeno ele
  | otherwise = digits xs               -- Senão, avanço para o próximo
