procedure buscar(NRR, clave, NRR_encontrado, pos_encontrada, resultado)
var clave_encontrada: boolean;
begin
    if (nodo = null) then
        resultado := false; {clave no encontrada}
    else
        posicionarYLeerNodo(A, nodo, NRR);
        claveEncontrada(A, nodo, clave, pos, clave_encontrada);
    if (clave_encontrada) then begin
        NRR_encontrado := NRR; { NRR actual }
        pos_encontrada := pos; { posicion dentro del array }
        resultado := true;
    end
    else
        buscar(nodo.hijos[pos], clave, NRR_encontrado, pos_encontrada,resultado)
end;

{

A. 




}