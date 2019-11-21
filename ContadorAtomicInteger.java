import java.java.util.concurrent.*;

public class Contador {
    AtomicInteger valor;

    public Contador(int inicio){
        this.valor = inicio;
    }

    public void incrementar(){
        int pegaESoma = this.valor.getAndAdd(1);
        // Podia ser também: this.valor.getAndIncrement();
        System.out.print(Thread.currentThread());
        System.out.printf(" incrementou para: %d\n", pegaESoma);
        return;
    }
}

public class Auxiliar implements Runnable {
    private Contador c;

    public Auxiliar(){
        this.c = new Contador(0);
    }

    public void run() {
        for(int f = 0; f < 5; f++){
            c.incrementar();
        }
    }
}

class Main {
    public static void main(String[] args) {
        Thread t1 = new Thread(new Auxiliar());
        Thread t2 = new Thread(new Auxiliar());
        Thread t3 = new Thread(new Auxiliar());
        t1.start(); t2.start(); t3.start();
    }
}
