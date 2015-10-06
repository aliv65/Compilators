var 
  ch: Char;
  pos: integer;
 
procedure error();
begin
  writeln('^':pos);
  writeln('Ошибка в символе ',ch);
  halt;
end;
 
procedure NextCh;
begin
  read(ch);
  pos += 1;  
end; 
 
begin
  writeln('Введите вещественное число (заканчивающееся символом !): ');
  
  NextCh;
 
  if char.IsDigit(ch) then
    NextCh
  else error;
 
  while (char.IsDigit(ch)) or (ch = '.') do
    NextCh;
 
  if ch<>'!' then
    error;
 
  writeln('Распознано вещественное число');
end.
