var
  ch: Char;
  pos: integer;
  str: string;

procedure error();
begin
  writeln('^':pos);
  WritelnFormat('Ошибка в символе {0}. Символы в последовательности должны чередоваться!', ch);
  halt;
end;

procedure NextCh;
begin
  read(ch);
  pos += 1;  
end;

begin
  writeln('Введите последовательность букв и цифр:');
  NextCh;
  if ch in ['A'..'z', 'А'..'я'] then
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
  
  while (ch in ['A'..'z', 'А'..'я']) or (char.IsDigit(ch)) do
    if ((char.IsDigit(str[pos - 1])) and (char.IsDigit(ch)) ) or ((char.IsLetter(str[pos - 1])) and (char.IsLetter(ch)) ) then error
    else
    begin
      str += ch;
      NextCh;
    end;
  
  if (ch = #13) or (ch = #10) then
	writeln('Распознана последовательность: ' + str)
  else
    error;
  
  
end.
