package clase1;

public class Auto {
    private String marca;
    private String modelo;
    private String color;
    private int velocidadActual = 0;

    private int anioFabricacion;


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

    /**
     * Cambiar la velocidad
     * @param nuevaVelocidad nueva velocity
     */
    public void modificarVelocidad(int nuevaVelocidad) {
        aumentarRegimen();
        velocidadActual = nuevaVelocidad;
    }

    public int obtenerVelocidad() {
        return velocidadActual;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getVelocidadActual() {
        return velocidadActual;
    }

    public void setVelocidadActual(int velocidadActual) {
        this.velocidadActual = velocidadActual;
    }

    public int getAnioFabricacion() {
        return anioFabricacion;
    }

    public void setAnioFabricacion(int anioFabricacion) {
        this.anioFabricacion = anioFabricacion;
    }
}


