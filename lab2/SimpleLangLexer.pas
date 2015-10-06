// ������������� ��������� �� ������� �����. �������������� ������ (������)
{ 
  �������:
  ;  :=  +=  -=  *=  id  num  begin  end  cycle

  �������� �����:
  begin  end  cycle
}
unit SimpleLangLexer;

interface

// TLex - ������������ ��� - ��� ������� ����������
// lexEot - ����� ������ ���������
type
  Tok = (EOF, ID, INUM, COLON, SEMICOLON, COMMA, PLUS, PREF_PLUS, MINUS, PREF_MINUS, MULT, PREF_MULT, DIVIDE, PREF_DIVIDE, &MOD, &DIV,
  &AND, &OR, &NOT, ASSIGN, &BEGIN, &END, CYCLE, LT, GT, NEQ, EQ, LEQ, GEQ, COMMENT, MULTI_COMMENT);

var
  fname: string;           // ��� ����� ���������
  LexRow, LexCol: integer;  // ������-������� ������ �������. ����� ������� = LexCol+Length(LexText)
  LexKind: Tok;            // ��� �������   
  LexText: string;         // ����� �������
  LexValue: integer;// ����� ��������, ��������� � �������� lexNum

procedure NextLexem;
procedure Init(fn: string);
procedure Done;
function TokToString(t: Tok): string;

implementation

var
  ch: Char;         // ������� ������
  f: text;          // ������� ����
  row, col: integer; // ������� ������ � ������� � �����
  KeywordsMap := new Dictionary<string, Tok>;// �������, �������������� �������� ������ ��������� ���� TLex. ���������������� ���������� InitKeywords


procedure LexError(message: string);// ������ ������������ �����������
begin
  var ss := System.IO.File.ReadLines(fname).Skip(row - 1).First(); // ������ row �����
  writeln('����������� ������ � ������ ', row, ':');
  writeln(ss);
  writeln('^':col - 1);
  if message <> '' then 
    writeln(message);
  Done;
  halt;
end;

procedure NextCh;
begin
  // � LexText ������������� ���������� ������ � ����������� ��������� ������
  LexText += ch;
  if not f.Eof then
  begin
    read(f, ch);
    if ch <> #10 then
      col += 1
    else
    begin
      row += 1;
      col := 1;
    end;
  end
  else 
  begin
    ch := #0; // ���� ��������� ����� �����, �� ������������ #0
    Done;
  end;
end;

procedure PassSpaces;
begin
  while char.IsWhiteSpace(ch) do
    NextCh;
end;

procedure PassLine;
begin
  while ch <> #13 do
    NextCh;
end;

procedure NextLexem;
begin
  PassSpaces;
  // R � ����� ������� ������ ������ ������� ������ � ch
  LexText := '';
  LexRow := Row;
  LexCol := Col;
  // ��� ������� ������������ �� �� ������� �������
  // ��� ������ ������� �������� �������������� ���������
  case ch of
    ';':
      begin
        NextCh;
        LexKind := Tok.SEMICOLON;
      end;
    ',':
      begin
        NextCh;
        LexKind := Tok.COMMA;
      end;
    ':':
      begin
        NextCh;
        if ch <> '=' then 
          LexKind := Tok.COLON
        else
          LexKind := Tok.ASSIGN;
        NextCh;
      end;
    '+':
      begin
        NextCh;
        if ch <> '=' then 
          LexKind := Tok.PLUS
        else
          LexKind := Tok.PREF_PLUS;
        NextCh;
      end;
    '-':
      begin
        NextCh;
        if ch <> '=' then 
          LexKind := Tok.MINUS
        else
          LexKind := Tok.PREF_MINUS;
        NextCh;
      end;
    '*':
      begin
        NextCh;
        if ch <> '=' then 
          LexKind := Tok.MULT
        else
          LexKind := Tok.PREF_MULT;
        NextCh;
      end;
    '/':
      begin
        NextCh;
        if ch = '/' then
        begin
          LexKind := Tok.COMMENT;
          PassLine;
        end
          else
        if ch <> '=' then
          LexKind := Tok.DIVIDE 
        else
          LexKind := Tok.PREF_DIVIDE;
        NextCh;
      end;
    '{':
      begin
        NextCh;
        LexKind := Tok.MULTI_COMMENT;
        repeat
          PassLine
        until ch <> '}';
        NextCh;
      end;
    '<':
      begin
        NextCh;
        if ch <> '=' then 
          LexKind := Tok.LT
        else if ch = '>' then
          LexKind := Tok.NEQ
        else
          LexKind := Tok.LEQ;
        NextCh;
      end;
    '>':
      begin
        NextCh;
        if ch <> '=' then 
          LexKind := Tok.GT
        else
          LexKind := Tok.GEQ;
        NextCh;
      end;
    '=':
      begin
        NextCh;
        LexKind := Tok.EQ;
      end;
    'a'..'z':
      begin
        while ch in ['a'..'z', '0'..'9'] do
          NextCh;
        if KeywordsMap.ContainsKey(LexText) then
          LexKind := KeywordsMap[LexText]
        else LexKind := Tok.ID;
      end;
    '0'..'9':
      begin
        while char.IsDigit(ch) do
          NextCh;
        LexValue := integer.Parse(LexText);
        LexKind := Tok.INUM;
      end;
    #0: LexKind := Tok.EOF;
  else lexerror('�������� ������ ' + ch);
  end;  
end;

procedure InitKeywords;
begin
  KeywordsMap['begin'] := Tok.&BEGIN;
  KeywordsMap['end'] := Tok.&END;
  KeywordsMap['cycle'] := Tok.CYCLE;
  KeywordsMap['mod'] := Tok.MOD;
  KeywordsMap['div'] := Tok.DIV;
  KeywordsMap['and'] := Tok.AND;
  KeywordsMap['or'] := Tok.OR;
  KeywordsMap['not'] := Tok.NOT;
end;

procedure Init(fn: string);
begin
  InitKeywords;
  fname := fn;
  AssignFile(f, fname);
  reset(f);
  row := 1;col := 1;
  NextCh;    // ������� ������ ������ � ch
  NextLexem; // ������� ������ �������, �������� LexText, LexKind �, ��������, LexValue
end;

procedure Done;
begin
  close(f);
end;

function TokToString(t: Tok): string;
begin
  Result := t.ToString;
  case t of
    Tok.ID: Result += ' ' + LexText;
    Tok.INUM: Result += ' ' + LexValue; 
  end;
end;

end.