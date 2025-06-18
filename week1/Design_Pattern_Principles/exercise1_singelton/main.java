public class main {
    public static void main(String[] args) {

        // First time we get the Logger — it gets created
        Logger logger1 = Logger.getInstance();
        logger1.log("First message");

        // Second time — it just gives us the same instance again
        Logger logger2 = Logger.getInstance();
        logger2.log("Second message");

        // Check if both are the exact same object
        System.out.println("Are both logger instances the same? " + (logger1 == logger2));
    }
}
