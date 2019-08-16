umaRaiz :: Float -> Float -> Float -> Float
umaRaiz a b c = -b/(2.0*a)

duasRaizes :: Float -> Float -> Float -> (Float, Float)
duasRaizes a b c = (d-e, d+e)
    where
        d = -b/(2.0*a)
        e = sqrt(b*b-4.0*a*c)/(2.0*a)

raiz :: (Float, Float, Float) -> String
raiz (a, b, c)

    |b*b == 4.0*a*c = show (umaRaiz a b c)
    |b*b > 4.0*a*c = show "duas raizes" ++ show f ++ " " ++ show s
    |otherwise = "no roots"
    where (f,s) = duasRaizes a b c
