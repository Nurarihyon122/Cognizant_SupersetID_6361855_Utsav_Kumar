namespace Code
{
    public class Product
    {
        public int productId;
        public string productName;
        public string category;

        public Product(int productId, string productName, string category)
        {
            this.productId = productId;
            this.productName = productName;
            this.category = category;
        }

        public Product(string str, double d)
        {
            // Placeholder constructor, as in Java
        }

        public override string ToString()
        {
            return productId + " | " + productName + " | Category: " + category;
        }
    }
}
