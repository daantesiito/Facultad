La solución es correcta pero no es la más adecuada.

¿Por qué NO es la más adecuada?
El semáforo sem es redundante. Si ya tenés alta = 4 y baja = 5, la combinación máxima posible es 4 + 5 = 9, pero como sem = 6 los limita a 6 en total.
Sin embargo, esa restricción ya está implícita en los otros dos:

Si entran 4 de alta y 2 de baja → 6 en total ✅
Si entran 1 de alta y 5 de baja → 6 en total ✅
Si entran 4 de alta y 5 de baja → sem los bloquearía en 6

Entonces sem sí es necesario para garantizar el tope de 6. Sin él podrían entrar 4 altas + 5 bajas = 9 simultáneos.

Entonces, ¿cuál es el problema real?
El orden de los P importa y puede causar deadlock.
Imaginá este escenario sin deadlock con la solución actual:

Un Usuario-Alta hace P(sem) → sem=5, luego P(alta) → entra ✅

Pero si el orden fuera al revés (P(alta) antes que P(sem)), dos procesos podrían tomar sus semáforos específicos y bloquearse mutuamente en sem. En esta solución el orden P(sem) primero evita el deadlock, lo cual está bien.