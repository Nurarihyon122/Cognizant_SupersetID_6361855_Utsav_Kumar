using System;

namespace SingletonExample
{
    public class Program
    {
        public static void Main(string[] args)
        {
            // First time: Logger gets created
            Logger logger1 = Logger.GetInstance();
            logger1.Log("First message");

            // Second time: same instance returned
            Logger logger2 = Logger.GetInstance();
            logger2.Log("Second message");

            // Checking if both instances are the same
            Console.WriteLine("Are both logger instances the same? " + (logger1 == logger2));
        }
    }
}
