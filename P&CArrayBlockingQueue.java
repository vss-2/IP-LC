import java.lang.*;
import java.util.*;
import java.util.concurrent.ArrayBlockingQueue;

public class Produtor implements Runnable {
    private ArrayBlockingQueue<Integer> abqp;

    public Produtor(ArrayBlockingQueue<Integer> abq){
        this.abqp = abq;
    }

    @Override
    public void run() {
        for(int f = 0; f < abqp.size(); f++){
            // Produzindo valores para o array
            try {
                System.out.printf("Produzi: %d\n", f);
                this.abqp.put(f);
                Thread.sleep(500);
            } catch (InterruptedException ie) {}
        }
    }

}

public class Consumidor implements Runnable {
    private ArrayBlockingQueue<Integer> abqc;

    public Consumidor(ArrayBlockingQueue<Integer> abq){
        this.abqc = abq;
    }

    @Override
    public void run() {
        for(int f = 0; f < abqc.size(); f++){
            // Consumindo valores do array
            try {
                System.out.printf("Consumi o: %d\n",this.abqc.take());
            } catch (InterruptedException ie) {}
        }
    }
}

public class ProdutorConsumidor {
    public static void main(String[] args) {
        ArrayBlockingQueue<Integer> abq = new ArrayBlockingQueue<Integer>(1000);
        
        Thread produtor = new Thread(new Produtor(abq));
        Thread consumidor = new Thread(new Consumidor(abq));

        produtor.start();
        consumidor.start();
    }
}
