import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.BeforeEach;

import ejecicio2.Cientifica;
import ejecicio2.Educativa;
import ejecicio2.Grupo;
import ejecicio2.NoRestringido;
import ejecicio2.Participante;
import ejecicio2.Recreativa;
import ejecicio2.Restringida;

class TestVisita {
    
    Recreativa recreativa;
    Educativa educativa;
    Cientifica cientifica;

    Grupo grupo;
    Participante p1;
    Participante p2;
    Participante p3;
    Participante p4;

    Restringida zonaRestringida1;
    Restringida zonaRestringida2;
    NoRestringido zonaNoRestringida1;

    @BeforeEach
    public void setUp() {
        recreativa = new Recreativa(LocalDate.now(), 6);
        educativa = new Educativa(LocalDate.now(), 5);
        cientifica = new Cientifica(LocalDate.now(), 3);

        grupo = new Grupo("sagrado", 5);
        p1 = new Participante("Dante", "1");
        p2 = new Participante("Julian", "2");
        p3 = new Participante("Pepe", "3");
        p4 = new Participante("Santi", "4");

        zonaRestringida1 = new Restringida("Jungla","una locura");
        zonaRestringida2 = new Restringida("Bosque","r2");
        zonaNoRestringida1 = new NoRestringido("Casa","casita");
    }

    @org.junit.jupiter.api.Test
    public void testCalcularImpacto() {
        recreativa.añadirParticipante(p1);
        recreativa.añadirParticipante(p2);
        assertEquals(12, recreativa.calcularImpacto()); 

        grupo.addAlumno(p1);
        grupo.addAlumno(p2);
        grupo.addAlumno(p3);
        grupo.addDocente(p4);
        educativa.anadirGrupo(grupo);
        assertEquals(12.5, educativa.calcularImpacto());
        
        cientifica.anadirCientifico(p1);
        cientifica.anadirCientifico(p2);
        cientifica.anadirCientifico(p3);
        cientifica.anadirCientifico(p4);
        cientifica.anadirZona(zonaRestringida1);
        cientifica.anadirZona(zonaRestringida2);
        cientifica.anadirZona(zonaNoRestringida1);
        assertEquals(260, cientifica.calcularImpacto());
    }

}