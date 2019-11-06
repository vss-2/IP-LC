# IP-LC
Bem, quem disse que IP só se paga uma vez?

## Comandos básicos:
```haskell
$ ghci (executa o Glasgow Haskell Compiler Interactive)
:load Main.hs     -- Carrega o módulo (arquivo ou "import")
:module -/+ Main  -- Descarrega/Carrega o módulo
:r ou :reload     -- Recarrega o módulo (faça isso após salvar o arquivo)
```

## Curiosidades:
* Divisão é feita por padrão entre doubles, então: 4/3 = 1.33333333 <br>
* Divisão entre inteiros depende do operador div <br>
* Operador ++ concatena coisas (Strings, listas, etc) <br>
* Operador /= é o != em outras linguagens <br> 
* Letras em case minúsculo são tipos genéricos <br>


## Threads

* Join: chamado (t.join()) deve ser cerceado por try-catch; <br> Faz com que a thread que chamou espere que outra termine a execução
