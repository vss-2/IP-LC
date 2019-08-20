umaRaiz :: Float -> Float -> Float -> Float
umaRaiz a b c = -b/(2.0*a)

-- Formato de input, ex: 2.0 4.0 1.0
-- Gera como output, ex: 1.53

duasRaizes :: Float -> Float -> Float -> (Float, Float)
duasRaizes a b c = (d-e, d+e)
    where
        d = -b/(2.0*a)
        e = sqrt(b*b-4.0*a*c)/(2.0*a)

-- Formato de input, ex: 3.0 5.0 2.0
-- Gera como output, ex: (4.3, 5.2)

raiz :: (Float, Float, Float) -> String
raiz (a, b, c)

    |b*b == 4.0*a*c = show (umaRaiz a b c)
    |b*b > 4.0*a*c = show "duas raizes" ++ show f ++ " " ++ show s
    |otherwise = "no roots"
    where (f,s) = duasRaizes a b c
    -- Observe que o where define quem são as variáveis nesse escopo
    
-- Formato de input: (5.0, 4.0, 1.0)
-- Gera como output: uma raiz:   1.53
--                  duas raizes: duas raizes 3.4 5.2
--                 nenhuma raiz: "no roots"
