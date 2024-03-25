'''5. Implementa un programa que solicite al usuario que ingrese una lista de números.
Luego, imprime la lista pero detén la impresión si encuentras un número negativo.
Nota: utilice la sentencia break cuando haga falta.'''

lista = []

num = int(input('Ingrese un numero: '))

while num != 0:
    lista.append(num)
    num = int(input('Ingrese un numero: '))

for i in lista:
    if i < 0:
        break
    else:
        print(i)