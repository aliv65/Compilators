var 
  ch: Char;
  pos: integer;
  str: String;
 
procedure error();
begin
  writeln('^':pos);
  writeln('Error ',ch);
  halt;
end;
 
procedure NextCh;
begin
  read(ch);
  pos += 1;  
end; 
 
begin
  writeln('Введите строковую  лексему  в одинарных ковычках: ');
  NextCh;
  if ch = #39 then
    NextCh
  else error;
 
  while char.IsDigit(ch) or char.IsLetter(ch) do
  begin
	str += ch;
    NextCh;
  end;
 
  if ch<>#39 then
    error;
 
  writeln('Detect string ' + str);
end.

