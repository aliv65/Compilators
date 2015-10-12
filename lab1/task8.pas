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
  
  NextCh;

  if char.IsLetter(ch) then
  begin
    str += ch;
    NextCh;
  end
  else error;
  
  if char.IsLetter(ch) then
  begin
    str += ch;
    NextCh;
  end;
  
  if char.IsDigit(ch) then
  begin
    str += ch;
    NextCh;
  end
  else error;
  
  if char.IsDigit(ch) then
  begin
    str += ch;
    NextCh;
  end;
  
  while (true) do
  begin
       
	   if char.IsLetter(ch) then
  begin
    str += ch;
    NextCh;
  end
  else break;
  
  if char.IsLetter(ch) then
  begin
    str += ch;
    NextCh;
  end;
  
  if char.IsDigit(ch) then
  begin
    str += ch;
    NextCh;
  end
  else break;
  
  if char.IsDigit(ch) then
  begin
    str += ch;
    NextCh;
  end;
  
  end;
     
  if (ch <> #13) or (ch <> #10) then
	 error;
  
  writeln('Распознана строка символов ', + str);
end.
