using System;

namespace DocumentFactoryPattern
{
    public class WordDocument : IDocument
    {
        public void Open()
        {
            Console.WriteLine("Opening a Word document.");
        }
    }
}
