// Program.cs

using System;

namespace Code
{
    class Program
    {
        static void Main(string[] args)
        {
            // Create an instance of Inventory
            Inventory inventory = new Inventory();

            // Add products to the inventory
            inventory.AddProduct("Laptop", 10);
            inventory.AddProduct("Smartphone", 20);
            inventory.AddProduct("Tablet", 15);

            // Display the quantity of a specific product
            Console.WriteLine("Quantity of Laptop: " + inventory.GetProductQuantity("Laptop"));

            // Remove some products from the inventory
            inventory.RemoveProduct("Smartphone", 5);
            Console.WriteLine("Quantity of Smartphone after removal: " + inventory.GetProductQuantity("Smartphone"));

            // Attempt to remove more products than available
            inventory.RemoveProduct("Tablet", 20);
        }
    }
}
