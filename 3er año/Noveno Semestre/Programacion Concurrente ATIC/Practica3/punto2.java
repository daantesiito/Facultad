// 2.  Existen N procesos que deben leer información de una base de datos, la cual es administrada 
// por un motor que admite una cantidad limitada de consultas simultáneas. 
// a. Analice el problema y defina qué procesos, recursos y monitores serán 
// necesarios/convenientes, además de las posibles sincronizaciones requeridas para 
// resolver el problema. 
// b. Implemente el acceso a la base por parte de los procesos, sabiendo que el motor de base 
// de datos puede atender a lo sumo 5 consultas de lectura simultáneas.

Monitor Motor 
    cond cola;  
    int esperando = 0; 
    int libres = 5;
 
    Procedure leer() 
         if (libres == 0) {
            esperando++;
            wait(cola);
         } else {
            libres--;
         }
    end;
 
    Procedure dejarleer () 
        if (esperando > 0) {
            esperando--;
            signal(cola);
        } else {
            libres++;
        }
    end; 
End Monitor;  
 
Process Proceso [a:1..M] 
   Motor.leer(); 
   “Leo la BD” 
   Motor.dejarleer(a); 
End Process; 