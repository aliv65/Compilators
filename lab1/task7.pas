var
  ch: Char;
  pos: integer;
  str: string;

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
  
  var list:= new List<char>;
  
  NextCh;

  if char.IsDigit(ch) then
  begin
    list.add(ch);
    NextCh;
  end
  else error;
  
  while (true) do
  begin
       
	   while (ch = ' ') do
             NextCh;
       if (char.IsDigit(ch)) then
			begin
				list.add(ch);
				NextCh;
             end
       else
          error;
       if (ch = ' ') then
			NextCh
	   else
	       break;
  end;
     
  if (ch <> #13) or (ch <> #10) then
	 error;
  
  writeln('��������� ����� ����� ', list.Print());
end.
