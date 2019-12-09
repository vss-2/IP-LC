-- 1a Questao
-- Letra A
retiraMultiplos :: Int -> [Int] -> [Int]
retiraMultiplos 1 b = b
retiraMultiplos a [] = []
retiraMultiplos a (x:xs) = if (mod x a == 0) then retiraMultiplos a xs
                           else x : retiraMultiplos a xs

primos ::  [Int] -> [Int]
primos [] = []
primos (x:xs) = x : primos(retiraMultiplos x xs)

-- Letra B
ePrimo :: Int -> Bool
ePrimo 1 = False
ePrimo 2 = True
ePrimo n | (length [x | x <- [2 .. n-1], mod n x == 0]) > 0 = False
         | otherwise = True

primosN :: Int -> [Int]
primosN n = filter(ePrimo) [1..n]
