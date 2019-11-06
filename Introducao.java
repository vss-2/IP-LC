// Podemos implementar uma Thread em java
// da seguinte forma:

public class OlaMundoR implements Runnable
{
    public void run()
    {
        System.out.println("Olá mundo!");
    }

    public static void main(String args[])
    {
        (new Thread(new OlaMundoR())).start();
    }
}

// Ou

public class OlaMundoT extends Thread
{
    public void run()
    {
        System.out.println("Olá mundo!");
    }

    public static void main(String args[])
    {
        (new OlaMundoT()).start();
    }
}

// A função join serve para tentar esperar a thread
// terminar a função que lhe foi solicitada, exemplo:

public class Espera extends Thread
{
    public void run()
    {
        for(int a = 0; a < 5; a++)
        {
            System.out.println("Estou terminando!");
        }
    }

    public static void main(String args[])
    {
        Thread e = (new Espera()).start();
        try
        {
            e.join();
            System.out.print("Terminei!");
        } catch (InterruptedException ie) {
            // Faz nada não visse
        }
    }
}

// O método sleep faz uma thread ser pausada.
// Porém, isto pode causar uma InterruptedException

// public void sleep(long tempo){

// }

// Podemos provocar interrupções usando:
// interrupt() e interrupted();

//-------------------------------------------------
//                 Exercicios
//-------------------------------------------------

/*
1. Implemente um programa que calcula todos os
números primos entre 1 e um valor N fornecido
como argumento. Seu programa deve dividir o
trabalho a ser realizado entre X threads (onde X
também é uma entrada do programa) para tentar
realizar o trabalho de maneira mais rápida que uma
versão puramente sequencial.

2. A thread principal do programa deve imprimir os
números primos identificados apenas quando as
outras threads terminarem.

3. Construa um programa onde N threads incrementam
contadores locais (não-compartilhados) em um laço. Cada
thread imprime o valor de seu contador a cada incremento.
As threads param quando seus contadores chegam a um
valor limite X, recebido como entrada pelo programa.
– Por que as saídas das threads se misturam?

4. Agora mude seu programa para que as threads modifiquem
um contador global compartilhado entre elas.
– O que acontece com os resultados?

5. Modifique o último programa que você construiu
para que, a cada iteração, a thread espere 1ms. A
thread que terminar a contagem primeiro (realizar
todas as iterações) deve interromper todas as outras
que estão executando.
*/
