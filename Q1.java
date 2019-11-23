import java.util.Scanner;

public class Q1 {
    public static void main(String[] args) {
        System.out.println("Insira quantidade de aviões esperando para sair: ");
        Scanner in = new Scanner(System.in);
        int N = in.nextInt();
        int[] horasS = new int[N]; //S = sair
        int[] horasC = new int[N]; //C = chegar

        System.out.println("Insira hora de cada avião saindo: ");
        for(int f = 0; f < N; f++){
            horasS[f] = in.nextInt();
        }

        System.out.println("Insira quantidade de aviões chegando: ");
        int M = in.nextInt();
        System.out.println("Insira hora de cada avião chegando: ");
        for(int f = 0; f < N; f++){
            horasC[f] = in.nextInt();
        }
        System.out.println("Insira quantidade de pistas: ");
        int K = in.nextInt();

        Thread t1 = new Thread(new Auxiliar(M+N, M));
        t1.start();
    }
}

public class Aviao {
    private String numero;
    private int horaSaida;
    private int horaChegada;

    public Aviao(String n, int hS, int hC){
        this.numero = n;
        this.horaSaida = hS;
        this.horaChegada = hC;
    }
}

public class Aeroporto implements Runnable {
    private boolean[] pistas; 
    private Aviao[] avioes;
    // 0 = vazia, 1 = ocupada;

    public Aeroporto(Aviao[] as){
        this.avioes = as;
    }

    public void ocuparPista(int f){
        synchronized(this.pistas){
            this.pistas[f] = true;
        }
        notifyAll();
        return;
    }

    public void desocuparPista(int f){
        synchronized(this.pistas){
            this.pistas[f] = false;
        }
        notifyAll();
        return;
    }

    public int pistaLivre(boolean[] pistas){
        for(int f = 0; f < pistas.length; f++){
            synchronized(this.pistas){
                if(pistas[f]) return f;
            }
        }
        return -1; // Tudo ocupado;
    }

    public void printaHoras(Aviao a){
        System.out.printf("Horario esperado de saida: %d, horario real: %d, atraso ocorrido: %d", aviao.hS, aviao.h);
    }

    public void decolar(){
        if(pistaLivre(pistas) != -1){
            ocuparPista(f);
        } else {
            try {
                wait();
            } catch (InterruptedException ie) {}
        }
        notifyAll();
        Thread.sleep(500);
    }

    public void aterrisar(){
        if(pistaLivre(pistas) != -1){
            ocuparPista(f);
        } else {
            try {
                wait();
            } catch (InterruptedException ie) {}
        }
        notifyAll();
        Thread.sleep(500);
    }

}
