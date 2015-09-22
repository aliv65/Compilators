var
  ch: Char;
  pos: integer;
  str: string;

procedure error();
begin
  writeln('^':pos);
  WritelnFormat('������ � ������� {0}. ����� ����� �� ����� ���������� � ����', ch);
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
  if ch in ['+', '-'] then
  begin
    str += ch;
    NextCh;
  end;
  
  if ch in ['1'..'9'] then
  begin
    str += ch;
    NextCh;
  end
  else error;
  
  while char.IsDigit(ch) do
  begin
    str += ch;
    NextCh;
  end;
  
  if ch <> '!' then
    error;
  
  writeln('���������� ����� ����� ' , StrToInt(str));
end.