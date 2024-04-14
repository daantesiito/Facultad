{A partir de un siniestro ocurrido se perdieron las actas de nacimiento y fallecimientos de
toda la provincia de buenos aires de los últimos diez años. En pos de recuperar dicha
información, se deberá procesar 2 archivos por cada una de las 50 delegaciones distribuidas
en la provincia, un archivo de nacimientos y otro de fallecimientos y crear el archivo maestro
reuniendo dicha información.
Los archivos detalles con nacimientos, contendrán la siguiente información: nro partida
nacimiento, nombre, apellido, dirección detallada (calle,nro, piso, depto, ciudad), matrícula
del médico, nombre y apellido de la madre, DNI madre, nombre y apellido del padre, DNI del
padre.
En cambio, los 50 archivos de fallecimientos tendrán: nro partida nacimiento, DNI, nombre y
apellido del fallecido, matrícula del médico que firma el deceso, fecha y hora del deceso y
lugar.
Realizar un programa que cree el archivo maestro a partir de toda la información de los
archivos detalles. Se debe almacenar en el maestro: nro partida nacimiento, nombre,
apellido, dirección detallada (calle,nro, piso, depto, ciudad), matrícula del médico, nombre y
apellido de la madre, DNI madre, nombre y apellido del padre, DNI del padre y si falleció,
además matrícula del médico que firma el deceso, fecha y hora del deceso y lugar. Se
deberá, además, listar en un archivo de texto la información recolectada de cada persona.
Nota: Todos los archivos están ordenados por nro partida de nacimiento que es única. Tenga
en cuenta que no necesariamente va a fallecer en el distrito donde nació la persona y
además puede no haber fallecido.}
program ejercicio18;
const
    DELEGACIONES = 50;
    valoralto = 9999;
type
    direcDetallada = record
        calle: string;
        nro: integer;
        piso: integer;
        depto: integer;
        ciudad: string;
    end;

    detalleN = record
        nroPartida: integer;
        nombre: string;
        apellido: string;
        direccion: direcDetallada;
        matriculaMed: integer;
        nombreMadre: string;
        apellidoMadre: string;
        DNIMadre: integer;
        nombrePadre: string;
        apellidoPadre: string;
        DNIPadre: string;
    end;

    fecha = record
        ano: integer;
        mes: integer;
        dia: integer;
    end;

    detalleF = record
        nroPartida: integer;
        nombre: string;
        apellido: string;
        matriculaMed: integer;
        fecha: fecha;
        hora: integer;
        direccion: direcDetallada;
    end;

    detalles = record
        n: detalleN;
        f: detalleF;
    end;

    archivoNacimiento = file of detalleN;

    archivoFallecimiento = file of detalleF;

    vectorDetalles = array [1..DELEGACIONES] of detalles;