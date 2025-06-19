namespace DocumentFactoryPattern
{
    public class PdfFactory : IDocumentFactory
    {
        public IDocument CreateDocument()
        {
            return new PdfDocument();
        }
    }
}
