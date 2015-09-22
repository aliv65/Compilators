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
  NextCh;
  if ch in ['+','-'] then
    NextCh;
 
  if char.IsDigit(ch) then
    NextCh
  else error;
 
  while char.IsDigit(ch) do
    NextCh;
 
  if ch<>#13 then
    error;
 
  writeln('Распознано целое число');
end.