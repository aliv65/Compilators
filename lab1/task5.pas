var
  ch: Char;
  pos: integer;
  str: string;

procedure error();
begin
  writeln('^':pos);
  WritelnFormat('������ � ������� {0}. ������� � ������������������ ������ ������������!', ch);
  halt;
end;

procedure NextCh;
begin
  read(ch);
  pos += 1;  
end;

begin
  writeln('������� ������������������ ���� � ����:');
  NextCh;
  if ch in ['A'..'z', '�'..'�'] then
  begin
    str += ch;
    NextCh;
  end
  else
    error;
  
  if char.IsDigit(ch) then
  begin
    str += ch;
    NextCh;
  end
  else
    error;
  
  while (ch in ['A'..'z', '�'..'�']) or (char.IsDigit(ch)) do
    if ((char.IsDigit(str[pos - 1])) and (char.IsDigit(ch)) ) or ((char.IsLetter(str[pos - 1])) and (char.IsLetter(ch)) ) then error
    else
    begin
      str += ch;
      NextCh;
    end;
  
  if (ch = #13) or (ch = #10) then
	writeln('���������� ������������������: ' + str)
  else
    error;
  
  
end.
