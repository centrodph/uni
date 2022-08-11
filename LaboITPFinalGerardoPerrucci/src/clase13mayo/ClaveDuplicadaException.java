package clase13mayo;

public class ClaveDuplicadaException extends Exception {
    public ClaveDuplicadaException() {
    }

    public ClaveDuplicadaException(String message) {
        super(message);
    }

    public ClaveDuplicadaException(String message, Throwable cause) {
        super(message, cause);
    }

    public ClaveDuplicadaException(Throwable cause) {
        super(cause);
    }
}
