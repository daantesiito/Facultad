program final;
const
    MAX_NUM = 1000;

type
    cod_s = 1..5;
    
    factura = record
        num_factura: integer;
        cod_sucursal: cod_s;
        monto_total: real;
    end;

    vectorFacturas = array [1..MAX_NUM] of factura;

// Se dispone: procedure cargarVector(var v: vectorFacturas; var dimL: integer);

{-----------------------------------------------------------
 SOLUCIÓN ÓPTIMA: O(n) en tiempo de ejecución
 Recorre el vector una sola vez, copiando solo los elementos
 que NO se deben eliminar y acumulando el monto de los que SÍ.
-----------------------------------------------------------}
procedure eliminarFacturas(var v: vectorFacturas; 
                           codSucursal: cod_s; 
                           var montoAcumulado: real; 
                           var dimL: integer);
var
    i, j: integer;  // i: índice para leer, j: índice para escribir
begin
    montoAcumulado := 0;  // Inicializar acumulador
    j := 1;                // j apunta a la siguiente posición donde escribir
    
    // Recorremos todo el vector desde 1 hasta dimL
    for i := 1 to dimL do begin
        if (v[i].cod_sucursal = codSucursal) then begin
            // Si es de la sucursal a eliminar: acumulamos el monto
            montoAcumulado := montoAcumulado + v[i].monto_total;
            // NO copiamos este elemento (se "elimina")
        end
        else begin
            // Si NO es de la sucursal: lo copiamos a la posición j
            v[j] := v[i];
            j := j + 1;  // Avanzamos la posición de escritura
        end;
    end;
    
    // Actualizamos la dimensión lógica
    dimL := j - 1;
end;

{-----------------------------------------------------------
 ALTERNATIVA: Solución menos eficiente pero más intuitiva
 (Elimina uno por uno, desplazando cada vez)
 Complejidad: O(n²) en el peor caso
-----------------------------------------------------------}
procedure eliminarFacturasIneficiente(var v: vectorFacturas; 
                                     codSucursal: cod_s; 
                                     var montoAcumulado: real; 
                                     var dimL: integer);
var
    i: integer;
begin
    montoAcumulado := 0;
    i := 1;
    
    while (i <= dimL) do begin
        if (v[i].cod_sucursal = codSucursal) then begin
            // Acumulamos el monto antes de eliminar
            montoAcumulado := montoAcumulado + v[i].monto_total;
            // Desplazamos todos los elementos hacia la izquierda
            for j := i + 1 to dimL do
                v[j - 1] := v[j];
            dimL := dimL - 1;
            // NO incrementamos i porque el siguiente elemento ya está en la posición i
        end
        else
            i := i + 1;  // Solo avanzamos si NO eliminamos
    end;
end;

var
    v: vectorFacturas;
    codSucursal: cod_s;
    montoAcumulado: real;
    dimL: integer;
begin
    // Se dispone: cargarVector(v, dimL);
    dimL := 0;  // Por ahora, asumimos que se carga con cargarVector
    
    writeln('Ingrese el codigo de sucursal a eliminar (1-5): ');
    readln(codSucursal);
    
    montoAcumulado := 0;
    eliminarFacturas(v, codSucursal, montoAcumulado, dimL);
    
    writeln('Monto acumulado de facturas eliminadas: $', montoAcumulado:0:2);
    writeln('Cantidad de elementos restantes en el vector: ', dimL);
end.

