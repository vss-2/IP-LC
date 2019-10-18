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
public void sleep(long tempo){
    
}

// Podemos provocar interrupções usando:
// interrupt() e interrupted();
