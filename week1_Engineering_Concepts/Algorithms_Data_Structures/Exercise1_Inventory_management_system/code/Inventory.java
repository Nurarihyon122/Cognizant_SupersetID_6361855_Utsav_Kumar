package code;
// Inventory.java
public class Inventory {
    //use array to store products
    private Product[] products;

    private int productCount;

    public Inventory() {
        products = new Product[1000]; // Initial capacity of 100 products
        productCount = 0;
    }

    // Method to add a product to the inventory
    public void addProduct(String name, int quantity) {
        if (productCount < products.length) {
            products[productCount++] = new Product(productCount, name, quantity, 0.0);
        } else {
            System.out.println("Inventory is full. Cannot add more products.");
        }
    }

    // Method to get the quantity of a specific product
    public int getProductQuantity(String name) {
        for (int i = 0; i < productCount; i++) {
            if (products[i].name.equals(name)) {
                return products[i].quantity;
            }
        }
        return 0; // Product not found
    }

    // Method to remove a specified quantity of a product
    public void removeProduct(String name, int quantity) {
        for (int i = 0; i < productCount; i++) {
            if (products[i].name.equals(name)) {
                if (products[i].quantity >= quantity) {
                    products[i].quantity -= quantity;
                    System.out.println("Removed " + quantity + " of " + name);
                } else {
                    System.out.println("Not enough stock to remove " + quantity + " of " + name);
                }
                return;
            }
        }
        System.out.println("Product not found: " + name);
    }


}
