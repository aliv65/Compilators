var
  ch: Char;
  pos: integer;
  str: string;

procedure error();
begin
  writeln('^':pos);
  WritelnFormat('Ошибка в символе {0}. Идентификатор должен начинаться с буквы!', ch);
  halt;
end;

procedure NextCh;
begin
  read(ch);
  pos += 1;  
end;

begin
  writeln('Введите идентификатор:');
  NextCh;
  if ch in ['A'..'z', 'А'..'я'] then
  begin
    str += ch;
    NextCh;
  end
  else
    error;
  
  while (ch in ['A'..'z', 'А'..'я']) or (char.IsDigit(ch)) do
  begin
    str += ch;
    NextCh;
  end;
  
  if ch <> #13 then
    error;
  
  writeln('Распознан идентификатор: ' + str);
end.