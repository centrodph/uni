package clase2;

public class Auto {
    private String color;
    private String marca;
    private String modelo;
    private int anioFabricacion;
    private int velocidadActual;
    private Motor motor;

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
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

    public int getAnioFabricacion() {
        return anioFabricacion;
    }

    public void setAnioFabricacion(int anioFabricacion) {
        this.anioFabricacion = anioFabricacion;
    }

    public int getVelocidadActual() {
        return velocidadActual;
    }

    public void setVelocidadActual(int velocidadActual) {
        this.velocidadActual = velocidadActual;
    }

    public Motor getMotor() {
        return motor;
    }

    public void acelerar() {
        this.motor.setRpmActuales(this.motor.getRpmActuales() + 1000);
        System.out.println("Acelerando");
    }

    public void setMotor(Motor motor) {
        this.motor = motor;
    }
}
