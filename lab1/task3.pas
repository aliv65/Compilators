var
  ch: Char;
  pos: integer;
  str: string;

procedure error();
begin
  writeln('^':pos);
  WritelnFormat('������ � ������� {0}. ������������� ������ ���������� � �����!', ch);
  halt;
end;

procedure NextCh;
begin
  read(ch);
  pos += 1;  
end;

begin
  writeln('������� �������������:');
  NextCh;
  if ch in ['A'..'z', '�'..'�'] then
  begin
    str += ch;
    NextCh;
  end
  else
    error;
  
  while (ch in ['A'..'z', '�'..'�']) or (char.IsDigit(ch)) do
  begin
    str += ch;
    NextCh;
  end;
  
  if ch <> #13 then
    error;
  
  writeln('��������� �������������: ' + str);
end.