import java.util.concurrent.*;

public class Contador {
	private int valor; 

	public Contador(int inicio){
		this.valor = inicio;
	}
	
	// Jeito 1
	public synchronized void incrementarBloco(){
		this.valor++;
		System.out.print(Thread.currentThread());
		System.out.printf("incrementou para: %d\n", this.valor);
		return;
	}
	
	// Jeito 2
	public void incrementarThis(){
		synchronized(this){
			this.valor++;
			System.out.print(Thread.currentThread());
			System.out.printf("incrementou para: %d\n", this.valor);
		}
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
			c.incrementarBloco();
		}
	}
}

class Main {
	public static void main(String args[]){
		Thread t1 = new Thread(new Auxiliar());
		Thread t2 = new Thread(new Auxiliar());
		Thread t3 = new Thread(new Auxiliar());
		t1.start(); t2.start(); t3.start();
	}
}
