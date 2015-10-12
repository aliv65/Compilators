var
  ch: Char;
  pos: integer;
  str: string;

procedure error();
begin
  writeln('^':pos);
  writeln('Ошибка в символе ', ch);
  halt;
end;

procedure NextCh;
begin
  read(ch);
  pos += 1;  
end;

begin
  writeln('Введите строковое представление числа (оканчивающееся символом !):');
  
  var list:= new List<char>;
  
  NextCh;

  if char.IsLetter(ch) then
  begin
    list.add(ch);
    NextCh;
  end
  else error;
  
  if (ch = ',') or (ch = ';') then
  while (true) do
  begin
       
	   if (ch = ',') or (ch = ';') then
			NextCh
		else break;
		if (char.IsLetter(ch)) then
			begin
				list.add(ch);
				NextCh;
			end
		else error;
  end;
     
  if (ch <> #13) or (ch <> #10) then
	 error;
  
  writeln('Распознан спсок букв ', list.Print());
end.
