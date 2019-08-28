map1 :: (a -> b) -> [a] -> [b]
map1 f [] = []
map1 f (x:xs) = f x : map1 f xs

ehDigito :: Char -> Bool
ehDigito ch = ('0' <= ch) && (ch <= '9')

somaPar :: (Int, Int) -> Int
somaPar (x,y) = x + y

mapCL f l = [ f x | x <- l ]

-- rode map1 ehDigito "e8uwq9dji49dqjwi0909r"
-- rode map1 somaPar [(1,2), (2,3), (3,4)]
-- rode mapCL inc [1..5]

filtro :: (a -> Bool) -> [a] -> [a]
filtro f [] = []
  | f x = x : filtro f xs
  | otherwise = filtro f xs

-- rode filtro ehPar [1..10]
-- filtro (>5) [1..10]

somaListaNovo :: [Int] -> Int 
somaListaNovo [] = 0
somaListaNovo (x:xs) = x + somaListaNovo xs

produtoLista :: [Int] -> Int
produtoLista [] = 1
--produtoLista (x:xs) = (*) x (produtoLista xs)
--produtoLista (x:xs) = x * produtoLista xs

mfoldr :: (t -> t -> t) -> t -> [t] -> t 
mfoldr f v [] = v 
mfoldr f v (x:xs) = f x (mfoldr f v xs)

-- rode mfoldr (||) False [True, False]

{-
mfoldr (||) False [True, False]
= (||) True (mfoldr (||) False [False])
= (||) True ((||) False (mfoldr (||) [False])
= (||) True ((||) False (mfoldr (||) [False])
= (||) True ((||) False False)
= (||) True ((||) False False)
= (||) True False)
= True
-}

-- rode map sing [[1,2], [3,4]]
-- rode foldr (++) []( (map sing [[1,2], [3,4]])