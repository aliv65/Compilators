uses SimpleLangLexer;
 
begin
  Init('a.txt');
  repeat
    writeln(TokToString(LexKind));
    NextLexem;
  until LexKind = Tok.EOF;
end.