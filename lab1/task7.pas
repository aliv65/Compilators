var
  ch: Char;
  pos: integer;
  str: string;
  list: List<integer>;

procedure error();
begin
  writeln('^':pos);
  writeln('������ � ������� ', ch);
  halt;
end;

procedure NextCh;
begin
  read(ch);
  pos += 1;  
end;

begin
  writeln('������� ��������� ������������� ����� (�������������� �������� !):');
  NextCh;

  if char.IsDigit(ch) then
  begin
    str += ch;
    NextCh;
  end
  else error;
  
  while (char.IsDigit(ch)) or (ch = ' ') do
  begin
    str += ch;
    NextCh;
  end;
  
  if ch <> '!' then
    error;
  
  
  
  writeln('��������� ����� ����� ', list.Println());
end.