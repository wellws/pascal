program HeapSort240616;

{
*
* Aluno: Wellington de Souza Silva
* 
* mudar os nomes da funções;
* términar de colocar em inglês
* Estudar os procedimentos heapify e siftDown
*
}

const
  MAX = 10;

type
  Tgiven  = integer;
  Tvector = array[0..MAX] of Tgiven;

var
  vector : Tvector;

procedure auto(var vector:Tvector);
var
  i : integer;
begin
  for i := 0 to MAX-1 do
  begin
    vector[i]:=random(150);
  end;
end;

procedure display(vector: Tvector);
var
  i: integer;
begin
	writeln;
	write('=>	| ');
  for i := 0 to MAX-1 do write(vector[i],' | ');
  writeln;
end;

procedure swap (var a, b: integer);
var
  temp: integer;
begin
  temp := a;
  a := b;
  b := temp;
end;

procedure siftDown ( var vector : Tvector; start, last: integer );
var
  root, child: integer;
begin
  root := start;
  while ( root * 2 + 1 <= last ) do begin
  child := root * 2 + 1;
  if ( child < last ) and ( vector[child] < vector[child + 1] ) then
    child := child + 1;
  if ( vector[root] < vector[child] ) then begin
    swap ( vector[root], vector[child] );
    root := child;
  end else
    break;
  end;
end;

procedure heapify ( var vector : Tvector; count: integer );
var
  start: integer;
begin
  start := (count - 1) div 2;
  while ( start >= 0 ) do
  begin
    siftDown (vector, start, count-1);
    start := start - 1;
  end;
end;

procedure heapSort( var vector : Tvector; lastVector:integer );
var
  last : integer;
begin
  heapify (vector, MAX );
  last := MAX - 1;
  writeln;
  writeln('Heap');
  display(vector);
  while ( last > 0 ) do
  begin
    swap(vector[last], vector[0]);
    last := last - 1;
    siftDown (vector, 0, last);
  end;
end;

//program
begin
	writeln;
  auto(vector);
  writeln('Vector Original');
  display(vector);
  heapSort (vector, MAX);
  writeln;
  writeln('Vector Ordenado');
  display(vector);
end.
