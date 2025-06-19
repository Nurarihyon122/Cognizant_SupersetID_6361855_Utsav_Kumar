// Inventory.cs

using System;

namespace Code
{
    public class Inventory
    {
        // Use array to store products
        private Product[] products;
        private int productCount;

        public Inventory()
        {
            products = new Product[1000]; // Initial capacity of 1000 products
            productCount = 0;
        }

        // Method to add a product to the inventory
        public void AddProduct(string name, int quantity)
        {
            if (productCount < products.Length)
            {
                products[productCount++] = new Product(productCount, name, quantity, 0.0);
            }
            else
            {
                Console.WriteLine("Inventory is full. Cannot add more products.");
            }
        }

        // Method to get the quantity of a specific product
        public int GetProductQuantity(string name)
        {
            for (int i = 0; i < productCount; i++)
            {
                if (products[i].Name == name)
                {
                    return products[i].Quantity;
                }
            }
            return 0; // Product not found
        }

        // Method to remove a specified quantity of a product
        public void RemoveProduct(string name, int quantity)
        {
            for (int i = 0; i < productCount; i++)
            {
                if (products[i].Name == name)
                {
                    if (products[i].Quantity >= quantity)
                    {
                        products[i].Quantity -= quantity;
                        Console.WriteLine($"Removed {quantity} of {name}");
                    }
                    else
                    {
                        Console.WriteLine($"Not enough stock to remove {quantity} of {name}");
                    }
                    return;
                }
            }
            Console.WriteLine($"Product not found: {name}");
        }
    }
}
