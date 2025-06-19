using System;

namespace Code
{
    public class Program
    {
        public static void Main(string[] args)
        {
            // Example usage of the FutureValue method
            double presentValue = 1000.0; // Initial investment
            double[] interestRate = { 0.05, 0.04, 0.06 }; // Interest rates for each year
            int years = interestRate.Length; // Number of years

            // Calculate future value
            double futureValue = Forecast.FutureValue(presentValue, interestRate, years);

            // Print the result
            Console.WriteLine(presentValue);
            for (int i = 0; i < years; i++)
            {
                Console.WriteLine("Year " + (i + 1) + " Interest Rate: " + (interestRate[i] * 100) + "%");
            }
            Console.WriteLine(futureValue);
        }
    }
}
