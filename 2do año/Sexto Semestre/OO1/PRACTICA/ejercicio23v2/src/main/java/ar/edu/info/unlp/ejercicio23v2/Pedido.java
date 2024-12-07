package ar.edu.info.unlp.ejercicio23v2;

public class Pedido {

    private Cliente cliente;
    private FormaDePago pago;
    private FormaDeEnvio envio;
    private Producto producto;
    private int cantSolicitada;

    public Pedido(Cliente cliente, FormaDePago pago, FormaDeEnvio envio, Producto producto, int cantSolicitada) {
        this.cliente = cliente;
        this.pago = pago;
        this.envio = envio;
        this.producto = producto;
        this.cantSolicitada = cantSolicitada;
    }

    public Bag<String> categoriaProducto(Bag<String> bag) {
        this.producto.sumarCategoria(bag);
        return bag;
    }

    public double calcularCostoTotal() {
        return this.pago.calcularPrecioTotal(this.producto.getPrecio()) + this.envio.calcularPrecioTotal(this.producto.getPrecio());
    }

}
