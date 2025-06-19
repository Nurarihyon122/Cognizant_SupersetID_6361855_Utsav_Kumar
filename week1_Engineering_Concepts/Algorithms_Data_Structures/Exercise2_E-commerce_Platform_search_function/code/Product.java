package code;

public class Product {
    int productId;
    String productName;
    String category;

    public Product(int productId, String productName, String category) {
        this.productId = productId;
        this.productName = productName;
        this.category = category;
    }

    public Product(String string, double d) {
        
    }

    
    public String toString() {
        return productId + " | " + productName + " | Category: " + category;
    }
}
