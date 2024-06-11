def funcionOriginal():
    import csv

    file_route = "./lagos_arg.csv"

    def my_function(data, *args):
        sub_data = filter(lambda x: x[1] in args and x[6]=="medio", data)
        return list(sub_data)

    with open(file_route, "r", encoding="utf-8") as data_set:
        reader = csv.reader(data_set)
        header, data = next(reader), list(reader)

    result1 = my_function(data, "Chubut", "Río Negro")
    result2 = my_function(data, "Neuquén")

    print(result1)
    print(f"\n****\n{result2}")

############################################################################################
# Solucion con PANDAS

def funcionPandas():
    import pandas as pd

    file_route = "./lagos_arg.csv"

    data = pd.read_csv(file_route) #DATAFRAME

    def my_function(data, *args):
        tamaños = data[(data.iloc[:, 1].isin(args)) & (data.iloc[:, 6] == "medio")] 
        return tamaños

    result1 = my_function(data, "Chubut", "Río Negro")
    result2 = my_function(data, "Neuquén")

    print(result1)
    print(f"\n****\n{result2}")

    tipos = data.dtypes # SERIE

    print(tipos)

############################################################################################
# A:
funcionOriginal()

print(' ------------------------------------------------ ')

# B:
funcionPandas()
# ILOC itera sobre filas y columnas: Si se pone ":", se leen todas las filas o todas las columnas.
# data.iloc[:,1]: Se leen todas las filas de la columna 1. En este caso, es la columna de Ubicación.
# .isin(args): Toma los argumentos que se pasan a la función y verifica si están en alguna fila de la columna 1.
# Primera condición: Se cumple si alguna fila de la columna 1 coincide con los argumentos.
# data.iloc[:, 6]: Recorre todas las filas de la columna 6, que es la columna de Sup Tamaños.
# Segunda condición: Se cumple si alguna fila de la columna 6 contiene el valor 'medio'.
# Resultado: Todo esto se guarda en un nuevo DataFrame llamado tamaños.

# C:
# Tipo DATAFRAME: data
# Tipo SERIES: tipos

# D:
# tipos = data.dtypes 
#
# print(tipos)

# E:
# 1- Pandas esta preparado para usar datasets grandes y funciona perfecto con muchos formatos, JSON, SQL, CSV, etc.
# 2- Tiene funciones que son mucho mas eficientes y faciles de usar que las operaciones basicas,
#    las cuales dan ventajas en optimizacion, indexacion, seleccion y lectura del programa.
# 3- Pandas se complementa muy bien con otras librerias de python y hace mas facil el trabajo complementado.
#    EJ: Matplotlib
# 4- Pandas tambien puede juntar 2 datasets o mas, utilizando el merge(), para trabajar todo junto.
