from antlr4 import *
from lenguajeutbLexer import lenguajeutbLexer
from lenguajeutbParser import lenguajeutbParser
from lenguajeutbVisitor import lenguajeutbVisitor


if __name__ == '__main__':
    entrada = FileStream("entrada.txt")
    lexer = lenguajeutbLexer(entrada)
    stream = CommonTokenStream(lexer)
    parser = lenguajeutbParser(stream)
    tree = parser.start_rule()
    visitor = lenguajeutbVisitor()
    visitor.visit(tree)
