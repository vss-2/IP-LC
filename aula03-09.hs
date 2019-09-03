-- Tipos Algébricos

data Temperatura = Quente | Frio deriving (Show)
data DiasSemana = Seg | Ter | Qua | Qui | Sex
data Estacao = Verao | Outono | Inverno | Primavera

clima :: Estacao -> Temperatura
clima Inverno = Frio
clima _ = Quente
--Rode: clima Inverno

data Pessoa = Nome String
nome :: Pessoa -> String
nome (Nome n) = n
--Rode: nome (Nome "Joao")

data Figura = Circulo Float | Retangulo Float Float
-- Circulo de raio float e Retangulo de lados Float
--Rode: :t Circulo
--Rode: :t (Circulo 3.0) ou :t (Retangulo 2.0 1.0)

type NomePessoa = String
type IdadePessoa = Int
data Pessoas = Pessoa NomePessoa IdadePessoa

showPessoa :: Pessoas -> String
showPessoa (Pessoa n i) = n ++ " -- " ++ show i
--Rode: showPessoa (Pessoa "Joao" 22)

data Expr = Lit Int
          | Add Expr Expr
          | Sub Expr Expr
eval :: Expr -> Int
eval (Lit n) = n
eval (Add e1 e2) = eval e1 + eval e2
eval (Sub e1 e2) = eval e1 - eval e2
{-
eval (Add (Lit 2) (Lit 3))
= eval (Lit 2) + eval (Lit 3)
= 2 + 3
= 5
-}

exibirExpr :: Expr -> String
exibirExpr (Lit n) = show n
exibirExpr (Add e1 e2) = "(" ++ exibirExpr e1 ++ " + " ++ exibirExpr e2 ++ ")"
