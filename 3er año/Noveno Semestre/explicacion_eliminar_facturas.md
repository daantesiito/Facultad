# Análisis del Ejercicio: Eliminar Facturas por Sucursal

## 📋 Problema
Eliminar todas las facturas de una sucursal específica de un vector, acumulando el monto total de las facturas eliminadas. La solución debe ser **óptima en tiempo de ejecución**.

---

## ❌ Errores en tu Código Original

### 1. **Error de Sintaxis**
```pascal
procedure eliminarFactura(numF: integer; var v: vectorFacturas; var contador: integer, var dimL: integer);
```
**Problema**: Usas coma (`,`) en lugar de punto y coma (`;`) entre parámetros.

**Corrección**:
```pascal
procedure eliminarFactura(numF: integer; var v: vectorFacturas; var contador: integer; var dimL: integer);
```

### 2. **Lógica de Eliminación Incorrecta**
```pascal
i:= 0;
j:= 0;
for j:= i+1 to dimL do begin
    if (v[j].cod_sucursal = numF) then begin
        v[j - 1] := v[j];  // ❌ ERROR: j empieza en 1, entonces v[0] no existe
        dimL:= dimL - 1;
        contador:= contador + 1;
    end;
end;
```

**Problemas**:
- `i` se inicializa en 0 pero nunca se usa ni se incrementa
- `v[j-1]` cuando `j=1` intenta acceder a `v[0]`, que no existe
- No desplaza correctamente los elementos
- Elimina elementos uno por uno, lo cual es ineficiente

### 3. **No Acumula el Monto**
El problema pide acumular el **monto total** de las facturas eliminadas, pero tu código solo cuenta la cantidad (`contador`).

### 4. **No es Óptimo**
Eliminar uno por uno y desplazar cada vez tiene complejidad **O(n²)** en el peor caso.

---

## ✅ Solución Correcta y Óptima

### Estrategia: **Un Solo Recorrido (O(n))**

La idea es usar **dos índices**:
- **`i`**: Índice para **leer** (recorre todo el vector)
- **`j`**: Índice para **escribir** (solo avanza cuando NO eliminamos)

### Algoritmo:

```
1. Inicializar j = 1 (próxima posición donde escribir)
2. Para cada posición i desde 1 hasta dimL:
   - Si v[i] se debe ELIMINAR:
     * Acumular su monto
     * NO copiarlo (se "elimina" al no copiarlo)
   - Si v[i] NO se debe eliminar:
     * Copiarlo a la posición j
     * Incrementar j
3. Actualizar dimL = j - 1
```

### Código:

```pascal
procedure eliminarFacturas(var v: vectorFacturas; 
                           codSucursal: cod_s; 
                           var montoAcumulado: real; 
                           var dimL: integer);
var
    i, j: integer;
begin
    montoAcumulado := 0;  // Inicializar acumulador
    j := 1;                // j: próxima posición donde escribir
    
    for i := 1 to dimL do begin
        if (v[i].cod_sucursal = codSucursal) then begin
            // ELIMINAR: acumulamos el monto, NO copiamos
            montoAcumulado := montoAcumulado + v[i].monto_total;
        end
        else begin
            // CONSERVAR: copiamos a la posición j
            v[j] := v[i];
            j := j + 1;
        end;
    end;
    
    dimL := j - 1;  // Actualizar dimensión lógica
end;
```

---

## 📊 Ejemplo Visual

Supongamos que tenemos este vector (dimL = 6) y queremos eliminar sucursal 2:

**Estado Inicial:**
```
Posición:  1    2    3    4    5    6
Sucursal:  1    2    1    2    3    2
Monto:     100  200  150  300  400  250
```

**Durante el recorrido:**

| i | v[i].cod | Acción | j | Vector después |
|---|----------|--------|---|----------------|
| 1 | 1 | Copiar a v[1] | 2 | [1, _, _, _, _, _] |
| 2 | 2 | **Eliminar** (acumular 200) | 2 | [1, _, _, _, _, _] |
| 3 | 1 | Copiar a v[2] | 3 | [1, 1, _, _, _, _] |
| 4 | 2 | **Eliminar** (acumular 300) | 3 | [1, 1, _, _, _, _] |
| 5 | 3 | Copiar a v[3] | 4 | [1, 1, 3, _, _, _] |
| 6 | 2 | **Eliminar** (acumular 250) | 4 | [1, 1, 3, _, _, _] |

**Resultado Final:**
```
Posición:  1    2    3
Sucursal:  1    1    3
Monto:     100  150  400
dimL = 3
montoAcumulado = 200 + 300 + 250 = 750
```

---

## 🔍 Comparación de Complejidad

### Tu Solución (Incorrecta):
- **Tiempo**: O(n²) - En el peor caso, elimina n elementos y desplaza n veces
- **Problema**: Lógica incorrecta, no funciona

### Solución Óptima:
- **Tiempo**: O(n) - Un solo recorrido del vector
- **Ventaja**: Eficiente y correcta

---

## 📝 Programa Completo

```pascal
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

procedure eliminarFacturas(var v: vectorFacturas; 
                           codSucursal: cod_s; 
                           var montoAcumulado: real; 
                           var dimL: integer);
var
    i, j: integer;
begin
    montoAcumulado := 0;
    j := 1;
    
    for i := 1 to dimL do begin
        if (v[i].cod_sucursal = codSucursal) then
            montoAcumulado := montoAcumulado + v[i].monto_total
        else begin
            v[j] := v[i];
            j := j + 1;
        end;
    end;
    
    dimL := j - 1;
end;

var
    v: vectorFacturas;
    codSucursal: cod_s;
    montoAcumulado: real;
    dimL: integer;
begin
    // Se dispone: cargarVector(v, dimL);
    dimL := 0;
    
    writeln('Ingrese el codigo de sucursal a eliminar (1-5): ');
    readln(codSucursal);
    
    montoAcumulado := 0;
    eliminarFacturas(v, codSucursal, montoAcumulado, dimL);
    
    writeln('Monto acumulado de facturas eliminadas: $', montoAcumulado:0:2);
    writeln('Cantidad de elementos restantes: ', dimL);
end.
```

---

## 🎯 Puntos Clave

1. **Dimensión Lógica**: Se actualiza al final (`dimL := j - 1`)
2. **Eficiencia**: Un solo recorrido O(n) en lugar de O(n²)
3. **Acumulación**: Se acumula el monto antes de "eliminar" (no copiar)
4. **Dos Índices**: Uno para leer (`i`) y otro para escribir (`j`)
5. **No Desplazamiento Múltiple**: Solo copiamos los elementos que conservamos

---

## 💡 ¿Por qué es Óptimo?

- **Un solo recorrido**: Recorremos el vector exactamente una vez
- **Sin desplazamientos múltiples**: Cada elemento se mueve como máximo una vez
- **Complejidad O(n)**: Lineal, la mejor posible para este problema

