package code;

import java.util.Arrays;
import java.util.Comparator;

public class search {
    Product[] products;

    public search(Product[] products) {
        this.products = products;
    }

    // Linear Search – Goes through each product one by one
    public Product linearSearch(String name) {
        for (Product p : products) {
            if (p.productName.equalsIgnoreCase(name)) {
                return p;
            }
        }
        return null; // Not found
    }

    // Binary Search – Faster, but only works on sorted array
    public Product binarySearch(String name) {
        // Sort by product name before binary search
        Arrays.sort(products, Comparator.comparing(p -> p.productName.toLowerCase()));

        int left = 0, right = products.length - 1;

        while (left <= right) {
            int mid = (left + right) / 2;
            int compare = products[mid].productName.compareToIgnoreCase(name);

            if (compare == 0) return products[mid];
            else if (compare < 0) left = mid + 1;
            else right = mid - 1;
        }

        return null; // Not found
    }
}
