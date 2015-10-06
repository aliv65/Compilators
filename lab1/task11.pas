var 
  ch: Char;
  pos: integer;
  str, tmp: String;
 
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
  writeln('Введите строковую  лексему, заключенную в /* */: ');
  NextCh;
  if ch = '/' then
  begin
    NextCh;
    if ch = '*' then
		NextCh
	else
		error;
  end
  else error;
 
  while char.IsDigit(ch) or char.IsLetter(ch) or (ch = '*') or (ch ='/') do
  begin
	if (ch = '*') then
	begin
		tmp := ch;
		NextCh;
		if (ch = '/') then
			break
		else
		str += tmp;
	end
	else
		str += ch;
    NextCh;
  end;
  
  if ch <> '/' then	
	error;
 
  writeln('Detect string ' + str);
end.

