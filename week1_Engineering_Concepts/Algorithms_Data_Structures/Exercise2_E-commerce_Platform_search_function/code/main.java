package code;

public class main {
    public static void main(String[] args) {
        Product[] products = {
            new Product(101, "Laptop", "Electronics"),
            new Product(102, "Mouse", "Electronics"),
            new Product(103, "Shoes", "Fashion"),
            new Product(104, "Book", "Education"),
            new Product(105, "Keyboard", "Electronics")
        };

        search engine = new search (products);

        // Linear Search Test
        System.out.println(" Linear Search for 'Mouse':");
        Product p1 = engine.linearSearch("Mouse");
        System.out.println(p1 != null ? p1 : "Product not found");

        // Binary Search Test
        System.out.println("\n Binary Search for 'Book':");
        Product p2 = engine.binarySearch("Book");
        System.out.println(p2 != null ? p2 : "Product not found");
    }
}
