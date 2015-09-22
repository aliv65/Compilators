var
  ch: Char;
  pos: integer;
  str: string;

procedure error();
begin
  writeln('^':pos);
  WritelnFormat('Ошибка в символе {0}. Целое число не может начинаться с нуля', ch);
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
  
  writeln('Распознано целое число ' , StrToInt(str));
end.