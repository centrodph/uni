package clase1;

import java.util.Date;

public class Persona {

    private Date fechaNacimiento;

    public long decirEdad() {
        Date fechaHoy = new Date();
        long edad = (this.fechaNacimiento.getTime() - fechaHoy.getTime()) / (1000 * 60 * 60 * 24 * 365);
        return edad;
    }
}
