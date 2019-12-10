--Questão 1
--s1 = (+2) 
--s2 = (>3)

--Questão 2
--A
merge :: Ord a => [a] -> [a] -> [a]
merge [] a = a
merge a [] = a
merge (x:xs) (y:ys)
    |x < y = x : merge xs (y:ys)
    |otherwise = y : merge (x:xs) ys

--B e C
metade :: [a] -> ([a],[a])
metade [] = ([],[])
metade (x:y:ys) =  (x:fst(metade ys),y:snd(metade ys))
metade (x:xs) = ([x],[])

msort :: Ord a => [a] -> [a]
msort [] = []
msort x 
    |length x /= 1 = merge (msort (fst (metade x))) (msort (snd (metade x)))
    |otherwise = x

--Questão 3
type Texto = String
type Id = String
type DataHoraPub = Int

data Post = Post(Id, DataHoraPub) Texto deriving (Show,Eq)
data Thread = Nil | T Post (Thread)

--A (Não funciona)
instance Show Thread where
show(T (Post (a,c) d) (b)) = "(" ++ a ++ " " ++ c ++ " " ++ d ++ ")" ++ b
show(Nil) = ""

--B
inserirPost :: Post -> Thread -> Thread
inserirPost a Nil = T(a) Nil
inserirPost a (T b c) = T(a) (T(b) c)

--C
threadToList :: Thread -> [Post]
threadToList Nil = []
threadToList (T a b) = a : threadToList b
--D
listToThread :: [Post] -> Thread
listToThread [] = Nil
listToThread (x:xs) = T x (listToThread xs)
--E
removerPost :: (Id, DataHoraPub) -> Thread -> Thread
removerPost (a,b) c = listToThread((filter (\(Post (x,y) z) -> x /= a || y /= b) (threadToList(c))))
