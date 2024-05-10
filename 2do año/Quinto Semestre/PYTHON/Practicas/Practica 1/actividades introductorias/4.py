'''4. Cree un programa que dada una lista de números imprima sólo los que son pares.
Nota: utilice la sentencia continue donde haga falta.'''

numeros = [2,4,5,7,8,55,4,33,22,1,13,543,234,12,333,111,30,300,5050,6060,555]

for i in numeros:
    if ((i % 2) == 0):
        print(i)