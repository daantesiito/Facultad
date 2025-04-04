import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.BeforeEach;

import ejparcialred.Contribuyente;
import ejparcialred.Inmueble;
import ejparcialred.Automotor;

class TestBien {
    
    Inmueble inmueble1;
    Inmueble inmueble2;
    Automotor automotor1;
    Automotor automotor2;
    Automotor automotor3;

    Contribuyente contribuyente;

    @BeforeEach
    public void setUp() {
        contribuyente =  new Contribuyente("dante", 1, "email1", "La Plata");
    }

    public void testCalcularImpacto() {
        contribuyente.altaAutomotor("aa111aa", "ford", "territory", LocalDate.of(2023, 6, 30), 30000);
        contribuyente.altaAutomotor("aa121aa", "fordd", "territoryy", LocalDate.of(2013, 6, 30), 60000);
        contribuyente.altaAutomotor("aa131aa", "forddd", "territoryyy", LocalDate.of(2020, 6, 30), 10000);
        contribuyente.altaInmueble(1,10 , 1000);
        contribuyente.altaInmueble(2,20 , 2000); 

        assertEquals(5030.0 ,contribuyente.calcularImpuesto()); // 1010 + 2020 + 1500 + 500 = 5030
    }

}
