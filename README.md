# 📝 Analisador Léxico em C# com ANTLR

## 👥 Grupo 1

* Conrado Maia
* Gabriel Figueiredo
* Jennifer Diehl
* Julia Martins

## 🎯 Enunciado da Tarefa

O objetivo desta atividade é **compreender, implementar e testar um analisador léxico** utilizando qualquer linguagem ou ferramenta (C, C++, Java, Python, JFlex, Flex, etc).

A ideia é construir um programa capaz de:

* Ler um código-fonte.
* Reconhecer e classificar seus **tokens** (identificadores, números, operadores, strings...).
* Preparar o caminho para as próximas fases da compilação (análise sintática e semântica).

---

## ⚙️ Como o código funciona

1. Foi usada a ferramenta **ANTLR4** para definir a gramática da linguagem.

   * Criamos um arquivo **MyLangLexer.g4** (responsável por reconhecer os tokens).
   * Criamos um arquivo **MyLangParser.g4** (responsável por organizar esses tokens em uma estrutura sintática).

2. A linguagem de exemplo escolhida foi um **Pascal reduzido**, mas com algumas **extensões inventadas**:

   * `print("texto")` → comando para imprimir na tela.
   * `x++` e `x--` → operadores de incremento e decremento.
   * `? :` → if ternário (`cond ? valor1 : valor2`).
   * Strings interpoladas (`"Olá ${nome}"`).

3. No **Program.cs**, o programa lê um arquivo `.pas`, passa pelo lexer e parser e:

   * Lista todos os **tokens encontrados**.
   * Mostra a **árvore sintática** correspondente.

---

## 📂 Estrutura do Projeto

```
AnalisadorLexico/
├── MyLangLexer.g4         # Gramática léxica
├── MyLangParser.g4        # Gramática sintática
├── Program.cs             # Código principal em C#
├── Testes/
│   ├── input1.pas         # Teste Pascal básico
│   ├── input2.pas         # Teste só com extensões
│   └── input3.pas         # Teste misto
└── README.md              
```

---

## ▶️ Como rodar

1. Gerar os arquivos C# a partir da gramática:

   ```powershell
   java -jar antlr-4.13.2-complete.jar -Dlanguage=CSharp MyLangLexer.g4 MyLangParser.g4
   ```
2. Rodar passando um arquivo `.pas` como entrada:

   ```powershell
   dotnet run testes/input1.pas
   ```

---

## ✅ Exemplo de Saída

Entrada (`input2.pas`):

```pascal
program Test2;
var nome : string;
begin
    print("Olá ${nome}!");
    nome := "Teste";
    x := 5 ? 100 : 200;
    x++;
    x--;
end.
```

Saída (simplificada):

```
TOKENS ENCONTRADOS:
PROGRAM -> 'program'
ID -> 'Test2'
...
INCREMENT -> '++'
DECREMENT -> '--'
END -> 'end'
DOT -> '.'

ÁRVORE SINTÁTICA:
(program program Test2 ... )
```

