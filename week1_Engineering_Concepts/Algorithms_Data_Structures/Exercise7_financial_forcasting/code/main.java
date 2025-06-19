package code;

public class main {
    public static void main(String[] args) {
        // Example usage of the futureValue method
        double presentValue = 1000.0; // Initial investment
        double[] interestRate = {0.05, 0.04, 0.06}; // Interest rates for each year
        int years = interestRate.length; // Number of years

        // Calculate future value
        double futureValue = Forecast.futureValue(presentValue, interestRate, years);
        
        // Print the result
        System.out.println(presentValue);
        for (int i = 0; i < years; i++) {
            System.out.println("Year " + (i + 1) + " Interest Rate: " + (interestRate[i] * 100) + "%");
        }
        System.out.println(futureValue);
    }
    
}
