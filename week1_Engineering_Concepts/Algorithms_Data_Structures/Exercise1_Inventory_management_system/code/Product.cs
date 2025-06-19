// Product.cs

namespace Code
{
    // Class representing a product
    public class Product
    {
        // Attributes of the Product class
        public int Id;
        public string Name;
        public int Quantity;
        public double Price;

        public Product(int id, string name, int quantity, double price)
        {
            Id = id;
            Name = name;
            Quantity = quantity;
            Price = price;
        }

        public override string ToString()
        {
            return $"Product{{id={Id}, name='{Name}', quantity={Quantity}, price={Price}}}";
        }
    }
}
