public class Auto {
    String marca;
    String modelo;
    String color;
    int velocidadActual = 0;

    public void acelerar() {
        aumentarRegimen();
        velocidadActual = velocidadActual + 10;
    }

    public void acelerarAlMaximo() {
        velocidadActual = 200;
    }

    public void frenar() {
        velocidadActual = 0;
    }

    private void aumentarRegimen() {
        System.out.println("aumentar rpm del motor");
    }

    public void establecerMarca(String unaMarca) {
        marca = unaMarca;
    }
    public String obtenerMarca() {
        return marca;
    }

    public void establecerMoldelo(String unaModelo) {
        modelo = unaModelo;
    }
    public String obtenerModelo() {
        return modelo;
    }

    public void establecerColor(String unaColor) {
        color = unaColor;
    }
    public String obtenerColor() {
        return color;
    }

    public void modificarVelocidad(int nuevaVelocidad) {
        aumentarRegimen();
        velocidadActual = nuevaVelocidad;
    }

    public int obtenerVelocidad() {
        return velocidadActual;
    }
}


