package clase2;

public class Prueba {
    public static void main(String[] args){
        Auto a = new Auto();
        a.setColor("rojo");
        a.setMarca("fiat");
        a.setModelo("uno");
        System.out.println("El auto es un " + a.getMarca());
    }
}
