'''Creación de un programa básico de gestión de inventario.

Desarrollar un programa en Python que permita gestionar un inventario simple de
productos, incluyendo funciones básicas como agregar productos, eliminar productos y mostrar el inventario.

El programa debe tener un menú interactivo que permita al usuario seleccionar las
siguientes operaciones:

    - Agregar un nuevo producto al inventario, solicitando al usuario el nombre y la cantidad
    inicial del producto.

    - Eliminar un producto existente del inventario, solicitando al usuario el nombre del
    producto a eliminar.

    - Mostrar el inventario actual, que incluya el nombre y la cantidad de cada producto.
    
    - Salir del programa.

El inventario puede ser almacenado utilizando un diccionario simple, donde las claves sean
los nombres de los productos y los valores sean las cantidades.

Se deben manejar situaciones simples como la introducción de productos duplicados o la
eliminación de productos inexistentes.'''

products = []

def add_products(products: list,name: str, quantity: int):
    products_to_add = {'Nombre': name, 'Cantidad': quantity}
    products.append(products_to_add)

def delete_products(products: list, name: str):
    for product in products:
        if product['Nombre'] == name:
            products.remove(product)

def show_products(products: list):
    i = 1
    for product in products:
        print(f'Producto: {i}\nNombre: {product['Nombre']}, Cantidad de productos: {product['Cantidad']}')
        i += 1

def check_exist(products: list, name: str, exist: bool):
    for product in products:
        if product['Nombre'] == name:
            exist = True
            return exist
    return exist

while True:

    print("*****************************")
    print("* Bienvenido al sistema de  *")
    print("* gestión de productos.     *")
    print("*                           *")
    print("* 1. Agregar producto.      *")
    print("*                           *")
    print("* 2. Eliminar producto.     *")
    print("*                           *")
    print("* 3. Mostrar inventario.    *")
    print("*                           *")
    print("* 4. Salir.                 *")
    print("*****************************")

    options = int(input('Ingrese el codigo de lo que quiera utilizar: '))

    match options:
        case 1:
            name = str(input('Ingrese el nombre del nuevo producto: '))

            exist = False

            exist = check_exist(products,name,exist)
            
            if not exist:
                quantity = str(input('Ingrese la cantidad de productos: '))
                
                add_products(products,name,quantity)
            else:
                print('Producto existente!')

        case 2:
            name = str(input('Ingrese el nombre del producto a eliminar: '))
            
            exist = False

            exist = check_exist(products,name,exist)

            if exist:
                delete_products(products,name)
                print('Producto eliminado perfectamente! ')
            else:
                print('Quieres eliminar un producto inexistente! ')

        case 3:
            show_products(products)
        
        case 4:
            break





        



