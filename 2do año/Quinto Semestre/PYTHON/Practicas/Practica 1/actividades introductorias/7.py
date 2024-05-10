'''7. Escribe un programa que tome una lista de números enteros como entrada del usuario.
Luego, convierte cada número en la lista a string y únelos en una sola cadena,
separados por guiones ('-'). Sin embargo, excluye cualquier número que sea múltiplo
de 3 de la cadena final.'''

lista = []

num = int(input('Ingrese un numero: '))

while num != 0:
    lista.append(num)
    num = int(input('Ingrese un numero: '))

cadena = ''

for i in lista:
    if i % 3 != 0:
        cadena += str(i)
        cadena += '-'

cadena = cadena.rstrip('-')

print(cadena)
