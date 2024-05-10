'''6. Modifique el ejercicio 4 para que dada la lista de número genere dos nuevas listas, una
con los número pares y otras con los que son impares. Imprima las listas al terminar de
procesarlas'''

numeros = [2,4,5,7,8,55,4,33,22,1,13,543,234,12,333,111,30,300,5050,6060,555]

lista_par = []

lista_impar = []

for i in numeros:
    if ((i % 2) == 0):
        lista_par.append(i)
    else:
        lista_impar.append(i)

print('Lista par: ')
for i in lista_par:
    print(i)

print('Lista impar: ')
for i in lista_impar:
    print(i)