public enum CorSemaforo
{   // Cores do semaforo, isso é tipo um array
    VERDE, AMARELO, VERMELHO;
}

public class ThreadSemaforo implements Runnable
{
    private CorSemaforo cor;  // Pega as cores do enum e permite usá-las no atributo
    private boolean parar;    // Para a execução
    private boolean corMudou;

    public ThreadSemaforo()
    {
        this.cor = CorSemaforo.VERMELHO; // Começa semáforo em vermelho
        this.parar = false;
        this.corMudou = false;
        new Thread(this).start();        // Começa a execução
    }
   
    public void run()
    {
        while(parar == false)
        {
            switch (this.cor)
            {
                case VERMELHO:
                try 
                {
                    Thread.sleep(2000) // Para o sinal por 2s
                } 
                catch (InterruptedException e)
                {
                    e.printStackTrace();
                }
                case AMARELO:
                try 
                {
                    Thread.sleep(500) // Para o sinal por 5s
                } 
                catch (InterruptedException e)
                {
                    e.printStackTrace();
                }
                case VERMELHO:
                try 
                {
                    Thread.sleep(1000) // Para o sinal por 1s
                } 
                catch (InterruptedException e)
                {
                    e.printStackTrace();
                }
            } 
        }

        private synchronized void mudarCor()
        {
            switch (this.cor)
            {
                case VERMELHO:
                    this.cor = CorSemaforo.VERDE;
                    break;
                case AMARELO:
                    this.cor = CorSemaforo.VERMELHO;
                    break;
                case VERDE:
                    this.cor = CorSemaforo.AMARELO;
                    break;
                default:
                    break;
            }
            this.corMudou = true;   // Mudou de cor
            notify();               // Avisa a thread que está esperando
        }

        public synchronized void esperaCorMudar()
        {
            while(!this.corMudou)
            {
                try
                {                
                    wait();         // Espera a cor mudar
                }
                catch (InterruptedException e)
                {
                    e.printStackTrace();
                }
            }
            this.corMudou = false;
        }

        public synchronized void desligarSemaforo()
        {
            this.parar = true;
        }

        public CorSemaforo getCor()
        {
            return cor;
        }
    }
}


public class SimuladorSemaforo 
{
    public static void main(String[] args)
    {
        ThreadSemaforo semaforo = new ThreadSemaforo();
    
        for(int f = 0; f < 10; f++)
        {
            System.out.println(semaforo.getCor());
                /*
                try 
                {
                    Thread.sleep(500) // Dorme por meio segundo para dar tempo de ver cada cor
                } 
                catch (InterruptedException e)
                {
                    e.printStackTrace();
                }
                */
            // Substituido por: 
            semaforo.esperaCorMudar();
        }
            this.desligarSemaforo();
    }
}
