import java.lang.*;

public class VetorSeguro {
    private Object VS[];

    public VetorSeguro(int tamanho){
        this.VS = new Object[tamanho];  
        // Construtor
    }

    public Object get(int posicao){
        synchronized(this.VS){
            return this.VS[posicao];
        } 
        // Acessando e devolvendo, com lock
    }

    public void set(int posicao, Object valor){
        synchronized(this.VS){
            this.VS[posicao] = valor;
        } 
        // Acessando e inserindo, com lock
    }

    public void swap(int posicao0, int posicao1){
        synchronized(this.VS){
            Object auxiliar = this.VS[posicao0];
            this.VS[posicao0] = this.VS[posicao1];
            this.VS[posicao1] = auxiliar;
        } 
        // Efetuando troca, com lock
    }

}

public class Auxiliar implements Runnable {
    private VetorSeguro vs;

    // Classe para testes

    public Auxiliar(){
        this.vs = new VetorSeguro(1000);
    }

    @Override
    public void run(){
        vs.set(0,123);
        vs.set(1,456);
        vs.swap(0,1);
        System.out.println(vs.get(0));
        System.out.println(vs.get(1));
        // Fazendo teste de definir, trocar e acessar
    }
}

public static void main(String[] args) {
    Thread t = new Thread(new Auxiliar());
    t.start();
    // Main chama classe de testes,
    // a qual chama a classe que implementou
}
