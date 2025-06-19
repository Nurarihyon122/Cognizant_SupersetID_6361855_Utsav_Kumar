package code;

public class main {
    public static void main(String[] args) {
        // Create an instance of Inventory
        Inventory inventory = new Inventory();

        // Add products to the inventory
        inventory.addProduct("Laptop", 10);
        inventory.addProduct("Smartphone", 20);
        inventory.addProduct("Tablet", 15);

        // Display the quantity of a specific product
        System.out.println("Quantity of Laptop: " + inventory.getProductQuantity("Laptop"));

        // Remove some products from the inventory
        inventory.removeProduct("Smartphone", 5);
        System.out.println("Quantity of Smartphone after removal: " + inventory.getProductQuantity("Smartphone"));

        // Attempt to remove more products than available
        inventory.removeProduct("Tablet", 20);
    }
}