public class Logger {

    // This is where we’ll keep the one and only Logger instance
    private static Logger instance;

    // Constructor is private, so no one can make a new Logger using 'new'
    private Logger() {
        System.out.println("Logger Initialized");
    }

    // This is the only way to get the Logger
    public static Logger getInstance() {
        // If it doesn't exist, create it
        if (instance == null) {
            instance = new Logger();
        }
        return instance;
    }

    // A simple method to simulate logging messages
    public void log(String message) {
        System.out.println("[LOG] " + message);
    }
}
