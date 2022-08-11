package clase13mayo;

public class DAOExceptiom extends Exception {

    public DAOExceptiom() {
    }

    public DAOExceptiom(String message) {
        super(message);
    }

    public DAOExceptiom(String message, Throwable cause) {
        super(message, cause);
    }

    public DAOExceptiom(Throwable cause) {
        super(cause);
    }

    public DAOExceptiom(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
