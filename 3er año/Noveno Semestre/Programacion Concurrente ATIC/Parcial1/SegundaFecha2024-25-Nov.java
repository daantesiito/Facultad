// 1. La Clave Única de Identificación Tributaria (CUIT) es un código utilizado en Argentina para identificar a las personas físicas y jurídicas.
// La CUIT consta de once (11) cifras numéricas, siendo la última un dígito verificador (del 0 al 9).
// Una empresa tiene una lista de CUITs que debe procesar, determinando la cantidad de CUITs por dígito verificador.
// Se dispone de un software con 5 workers que trabajan colaborativamente procesando una CUIT por vez cada uno.
// Al finalizar el procesamiento, el último worker en terminar debe informar los resultados.
// Se dispone de la función obtenerDV(CUIT) que retorna el dígito verificador de la CUIT recibida como entrada.
// La lista de CUITs se almacena como una cola global.
// Resuelva usando SEMÁFOROS, maximizando la concurrencia.

cola cola_cuits;
sem mutex = 1;
sem mutex_final = 1;
int cuits_total = cola_cuits.size();
int vector_cuits_global[0..9] = 0;
int terminados = 0;

Process Worker[id: 0..4]

    int digito_final;
    int vector_cuits_local[0..9] = 0;
    bool seguir = true;
    int cuit_actual;

    while (seguir) {
        P(mutex);
        if (cuits_total > 0) {
            cuits_total--;
            Sacar(cola_cuits, cuit_actual);
            V(mutex);

            digito_final = obtenerDV(cuit_actual)

            vector_cuits_local[digito_final]++;
        } else {
            seguir = false;
            V(mutex);
        }   
    }

    P(mutex_final);
        for (int i= 0; i<=9; i++) {
            vector_cuits_global[i] = vector_cuits_global[i] + vector_cuits_local[i];
        }

        terminados++;

        if (terminados == 5) {
            for (int i= 0; i <= 9; i++) {   
                Imprimir(vector_cuits_global[i]);
            }
        }
    V(mutex_final);

end Process


// 2. En un negocio hay un empleado que diseña tarjetas digitales.
// El empleado debe atender los pedidos de C clientes, en el orden en que se hacen los pedidos.
// El cliente envía las indicaciones y el empleado diseña la tarjeta y se la envía.
// La función HacerTarjeta(indicaciones) simula el armado de la tarjeta por parte del empleado.
// Todos los procesos deben terminar su ejecución.
// Resuelva usando MONITORES, maximizando la concurrencia.

Monitor Admin

    int esperando = 0;
    cond haySolicitud;
    cond colaEsperaTerminar[C];
    
    text tarjetas[C];
    cola colaPedidos; 

    Procedure solicitar_tarjeta(id: in int, indicaciones: in text, tarjeta_lista: out text) {
        Insertar(colaPedidos, id, indicaciones);
        esperando++;
        signal(haySolicitud);

        wait(colaEsperaTerminar[id]);

        tarjeta_lista = tarjetas[id];
    }

    Procedure buscar_pedido(id_usar: out int, indicaciones_usar: out text) {
        while (esperando == 0) {
            wait(haySolicitud);
        }
        
        Sacar(colaPedidos, id_usar, indicaciones_usar);
        esperando--;
    }

    Procedure enviar_tarjeta(id_usar: in int, tarjeta_lista: in text) {
        tarjetas[id_usar] = tarjeta_lista;

        signal(colaEsperaTerminar[id_usar]);
    }

end Monitor;


Process Cliente[id: 0..C-1]
    text indicaciones = "...";
    text mi_tarjeta;

    Admin.solicitar_tarjeta(id, indicaciones, mi_tarjeta);

end Process;


Process Empleado

    int id_usar;
    text indicaciones;
    text tarjeta_armada;

    for (int i = 0; i < C; i++) { 
        
        Admin.buscar_pedido(id_usar, indicaciones);

        tarjeta_armada = HacerTarjeta(indicaciones); 

        Admin.enviar_tarjeta(id_usar, tarjeta_armada);
    }

end Process;