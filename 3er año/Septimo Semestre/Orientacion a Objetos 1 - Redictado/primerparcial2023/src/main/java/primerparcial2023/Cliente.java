package primerparcial2023;

import java.time.LocalDate;
import java.util.ArrayList;

public class Cliente {
    
    private String nombre;
    private String email;
    private LocalDate fechaAlta;
    private ArrayList<Pedido> pedidos;

    public Cliente(String nombre, String email) {
        this.nombre = nombre;
        this.email = email;
        this.fechaAlta = LocalDate.now();
        this.pedidos = new ArrayList<Pedido>();
    }

    public double cantProductosPedidos(Producto producto) {
        return this.pedidos.stream().mapToDouble(p -> p.cantProductos(producto)).sum();
    }
}