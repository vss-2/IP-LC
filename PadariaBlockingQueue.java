import java.lang.*;

public class PadariaBlockingQueue {
    private int forno[];
    // 0 = sem pão
    // 1 = com pão

    public PadariaBlockingQueue(){
        this.forno = new int[50];
    }

    public void abastecer(int quantidade){
        synchronized(this.forno){
            int e = 0;
            
            // Vejo se o forno está limpo
            for(e = 0; e < 50; e++){
                if (this.forno[e] != 0){
                    System.out.println("Há pães no forno, não posso abastecer");
                    return;
                }
            }

            // Boto os 50 pães
            for(int f = 0; f < 50; f++){
                this.forno[f] = 1;
            }
        }
    }

    public void retirar(){
        synchronized(this.forno){
            int e = 0;
            int contador = 0;
            // Vejo onde tem pão
            for(e = 0; e < 50; e++){
                if (this.forno[e] == 1){
                    break;
                }
            }

            // Tiro os pães
            for(e = e; e < 10; e++){
                this.forno[e] = 0;
            }
        }
    }
}

public class Auxiliar implements Runnable {
    private PadariaBlockingQueue bq;

    public Auxiliar(){
        this.bq = new PadariaBlockingQueue();
    }

    @Override
    public void run() {
        bq.abastecer(50);
        Thread.sleep(5000);
        bq.retirar();
        Thread.sleep(1000);
        bq.abastecer(50);
        Thread.sleep(5000);
        bq.abastecer(50);
        Thread.sleep(5000);
        bq.abastecer(50);
        Thread.sleep(5000);
        bq.retirar();
        Thread.sleep(1000);
        bq.retirar();
        Thread.sleep(1000);
        bq.retirar();    
        Thread.sleep(1000);
    }
}
