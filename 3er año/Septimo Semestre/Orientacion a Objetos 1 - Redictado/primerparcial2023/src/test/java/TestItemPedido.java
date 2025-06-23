
import primerparcial2023.Producto;
import primerparcial2023.ItemPedido;
import primerparcial2023.Nacional;

class TestItemPedido {

    Producto producto1;
    Producto producto2;
    ItemPedido itemPedido1;
    ItemPedido itemPedido2;

    @BeforeEach
    public void setUp() {
        producto1 = new Nacional("p1", "1", 10);
        producto2 = new Nacional("p2", "2", 20);
        itemPedido1 = new ItemPedido(3, producto1);
        itemPedido2 = new ItemPedido(4, producto1);
    }

    public void testGetCantProducto() {
        assertEquals(3, itemPedido1.getCantProducto(producto1));
        assertEquals(0, itemPedido1.getCantProducto(producto2));
    }

}