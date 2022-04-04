package clase2;

public class Prueba {
    public static void main(String[] args){
        Auto a = new Auto();
        a.setColor("rojo");
        a.setMarca("fiat");
        a.setModelo("uno");
        System.out.println("El auto es un " + a.getMarca());

        Motor motor = new Motor();
        motor.setCilindrada(123);
        motor.setPotencia(22);
        motor.setRpmActuales(0);

        a.setMotor(motor);

        a.acelerar();
        System.out.println("auto rpm: " + a.getMotor().getRpmActuales());
        a.acelerar();
        System.out.println("auto rpm: " + a.getMotor().getRpmActuales());
    }
}
