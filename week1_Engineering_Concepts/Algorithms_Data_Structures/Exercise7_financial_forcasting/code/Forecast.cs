namespace Code
{
    public class Forecast
    {
        // Recursive method to calculate future value
        public static double FutureValue(double presentValue, double[] interestRate, int years)
        {
            // Base case: if years is 0, return present value
            if (years == 0)
            {
                return presentValue;
            }

            // Recursive call to get value of previous year
            double previousYearValue = FutureValue(presentValue, interestRate, years - 1);

            // Calculate current year's value with growth rate for the current year
            return previousYearValue * (1 + interestRate[years - 1]);
        }
    }
}
