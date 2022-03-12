public class Test {
    public static void main(String[] args){
        Auto miAuto = new Auto();
        miAuto.establecerColor("ROJO");
        miAuto.establecerMarca("Ford");
        miAuto.establecerMoldelo("FOCUS");
        miAuto.acelerar();
        System.out.println(miAuto.obtenerVelocidad());
    }
}
