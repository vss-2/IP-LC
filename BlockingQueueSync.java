import java.lang.*;

public class BlockingQueue {
    private Object fb[];
    private int capacidade;

    public BlockingQueue(int tamanho){
        this.fb = new BlockingQueue[tamanho];
        this.capacidade = 0;
    }

    public void put(Object valor){
        synchronized(this.fb){
            if(this.capacidade < this.fb.length){
                // Se couber, bota na fila
                this.fb[capacidade] = valor;

                // Notificar que o serviço acabou
                notifyAll();
            } else {
                // Senão couber, espera caber
                wait();
            }
        }
    }

    public Object take(){
        synchronized(this.fb){
            if(this.fb[0] == null){
                // Se não tiver ninguém, espera
                wait();
            } else {
                // Senão, há alguém, retorne-o
                Object output = this.fb[0];

                // Avança a fila
                for(int f = this.capacidade; f < 1; f--){
                    this.fb[f-1] = this.fb[f];
                }

                // Notificar que o serviço acabou
                notifyAll();
                return output;
            }
        }
    }
}

public class Auxiliar implements Runnable {
    private BlockingQueue bq;

    public Auxiliar(){
        this.bq = new BlockingQueue(1000);
    }

    @Override
    public void run() {
        bq.put(10);
        System.out.println(bq.take());
        bq.put(15);
        bq.put(20);
        bq.put(25);
        System.out.println(bq.take());
        System.out.println(bq.take());
        System.out.println(bq.take());    
    }
}

public public static void main(String[] args) {
    Thread t = new Thread(new Auxiliar());
}
