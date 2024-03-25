program ass;
type
    puntero=^integer;
var
    p,q:puntero;
begin
    new(p);
    p^:=14;
    writeln(p^);
    q:=p;
    q^:=q^*10;
    writeln(p^);
    writeln(q^);
    dispose(q);
    writeln(p^);
    writeln(q^);
end.
