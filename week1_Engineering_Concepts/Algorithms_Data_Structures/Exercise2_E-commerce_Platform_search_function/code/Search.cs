using System;
using System.Linq;

namespace Code
{
    public class Search
    {
        private Product[] products;

        public Search(Product[] products)
        {
            this.products = products;
        }

        public Product LinearSearch(string name)
        {
            foreach (Product p in products)
            {
                if (p.productName.Equals(name, StringComparison.OrdinalIgnoreCase))
                {
                    return p;
                }
            }
            return null;
        }

        public Product BinarySearch(string name)
        {
            var sorted = products.OrderBy(p => p.productName.ToLower()).ToArray();

            int left = 0, right = sorted.Length - 1;

            while (left <= right)
            {
                int mid = (left + right) / 2;
                int compare = string.Compare(sorted[mid].productName, name, true);

                if (compare == 0) return sorted[mid];
                else if (compare < 0) left = mid + 1;
                else right = mid - 1;
            }

            return null;
        }
    }
}
