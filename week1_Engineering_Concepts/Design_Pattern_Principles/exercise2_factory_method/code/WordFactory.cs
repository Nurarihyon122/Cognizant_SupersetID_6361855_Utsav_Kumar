namespace DocumentFactoryPattern
{
    public class WordFactory : IDocumentFactory
    {
        public IDocument CreateDocument()
        {
            return new WordDocument();
        }
    }
}
