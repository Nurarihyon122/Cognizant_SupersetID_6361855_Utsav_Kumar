using System;

namespace Code
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Product[] products = {
                new Product(101, "Laptop", "Electronics"),
                new Product(102, "Mouse", "Electronics"),
                new Product(103, "Shoes", "Fashion"),
                new Product(104, "Book", "Education"),
                new Product(105, "Keyboard", "Electronics")
            };

            Search engine = new Search(products);

            Console.WriteLine(" Linear Search for 'Mouse':");
            Product p1 = engine.LinearSearch("Mouse");
            Console.WriteLine(p1 != null ? p1.ToString() : "Product not found");

            Console.WriteLine("\n Binary Search for 'Book':");
            Product p2 = engine.BinarySearch("Book");
            Console.WriteLine(p2 != null ? p2.ToString() : "Product not found");
        }
    }
}
