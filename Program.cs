using Antlr4.Runtime;

class Program
{
    static void Main(string[] args)
    {
        if (args.Length == 0)
        {
            Console.WriteLine("Execute o comando: dotnet run <arquivo.pas>");
            return;
        }

        string code = File.ReadAllText(args[0]);

        var input = new AntlrInputStream(code);
        var lexer = new MyLangLexer(input);
        var tokens = new CommonTokenStream(lexer);
        var parser = new MyLangParser(tokens);

        var tree = parser.program();

        Console.WriteLine("TOKENS ENCONTRADOS:");
        tokens.Fill();
        foreach (var t in tokens.GetTokens())
        {
            string name = lexer.Vocabulary.GetSymbolicName(t.Type);
            Console.WriteLine($"{name} -> '{t.Text}'");
        }

        Console.WriteLine("\nÁRVORE SINTÁTICA:");
        Console.WriteLine(tree.ToStringTree(parser));
    }
}
