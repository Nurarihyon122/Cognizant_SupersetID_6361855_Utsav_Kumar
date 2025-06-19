using System;

namespace SingletonExample
{
    public class Logger
    {
        // Private static instance of Logger
        private static Logger instance;

        // Private constructor to prevent external instantiation
        private Logger()
        {
            Console.WriteLine("Logger Initialized");
        }

        // Public method to get the single instance
        public static Logger GetInstance()
        {
            if (instance == null)
            {
                instance = new Logger();
            }
            return instance;
        }

        // Method to log a message
        public void Log(string message)
        {
            Console.WriteLine("[LOG] " + message);
        }
    }
}
