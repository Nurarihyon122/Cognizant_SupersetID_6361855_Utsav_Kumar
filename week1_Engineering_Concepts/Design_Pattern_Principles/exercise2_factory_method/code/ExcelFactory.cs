namespace DocumentFactoryPattern
{
    public class ExcelFactory : IDocumentFactory
    {
        public IDocument CreateDocument()
        {
            return new ExcelDocument();
        }
    }
}
