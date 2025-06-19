using System;

namespace DocumentFactoryPattern
{
    public class Program
    {
        public static void Main(string[] args)
        {
            IDocumentFactory factory;

            factory = new PdfFactory();
            IDocument pdf = factory.CreateDocument();
            pdf.Open();

            factory = new WordFactory();
            IDocument word = factory.CreateDocument();
            word.Open();

            factory = new ExcelFactory();
            IDocument excel = factory.CreateDocument();
            excel.Open();
        }
    }
}
