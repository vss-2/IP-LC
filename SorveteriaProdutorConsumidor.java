public class Main {
    public static void main(String[] args) {
        Buffer RMR = new Buffer(200);
        Consumidor mistra = new Consumidor(100);
        Produtor aroma = new Produtor(RMR, 100, 1);
        Produtor espessante = new Produtor(RMR, 100, 2);
    }
}

public class Buffer implements Runnable {
    int[] volume;
    int capacidadeAtual = 0;
    boolean cheio = false;

    public Buffer(int c){
        this.volume = c;
        this.cheio = false;
    }

    public synchronized void preencher(int quant, int pos, int tipo){
        while(this.volume[99] != 0 || this.volume[199] != 0){  
            // Pula caso ambos estejam vazios, aguarda se um dos estiver cheio
            try {
                wait();
            } catch (InterruptedException ie) { }
        }
        for(int f = pos; f < quant; f++){
            this.volume[f] = tipo;
        }
        if(this.volume[99] != 0 && this.volume[199] != 0){
            this.cheio = true;
            this.capacidadeAtual = 100; // 100%
            // Ambos os recipientes estão cheios
        }
        notifyAll();
        return;
    }

    public synchronized void consumir(){
        while(this.volume[99] == 0 || this.volume[199] == 0){ 
            // Aguarda se array um dos espessantes ou aromatizantes estiver vazio
            try {
                wait();
            } catch (InterruptedException ie) {}
        }
        for(int f = 0; f < this.volume.length/2; f++){
            this.volume[f] = 0;     // Consome aromatizantes
            this.volume[f+100] = 0; // Consome espessantes
        }
        this.capacidadeAtual = 0; // 0%
        this.cheio = false;
        notifyAll();
        return;
    }
}

public class Produtor implements Runnable {
    Buffer buffer;
    int tipo;
    int quant;

    public Produtor(Buffer b, int quant, int tipo){
        this.buffer = b;
        this.tipo = tipo;
        this.quant = quant;
    }

    public void run(){
        if(this.tipo == 1){
            buffer.preencher(quant, 0, tipo);
            // 0 a 99 são aromatizantes
        } else {
            buffer.preencher(quant, 100, tipo);
            // 100 a 199 são espessantes
        }
    }
}

public class Consumidor implements Runnable {
    Buffer buffer;

    public Consumidor(Buffer b){
        this.buffer = b;
    }

    public void run(){
        b.consumir();
    }
}
