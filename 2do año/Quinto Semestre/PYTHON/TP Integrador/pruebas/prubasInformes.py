import csv
import pathlib

aeropuerto_path = pathlib.Path("./custom_datasets/processed_airports.csv")
lagos_path = pathlib.Path("./custom_datasets/lagos_arg.csv")
conectividad_path = pathlib.Path("./custom_datasets/Conectividad_Internet.csv")
resumen_adaptado_path = pathlib.Path("./custom_datasets/c2022_tp_c_resumen_adaptado.csv")
ar_path = pathlib.Path("./datasets/ar.csv")

read_aeropuerto = aeropuerto_path.open(mode='r', encoding= 'utf-8')
read_lagos = lagos_path.open(mode='r', encoding= 'utf-8')
read_conectividad = conectividad_path.open(mode='r', encoding= 'utf-8')
read_resumen_adaptado = resumen_adaptado_path.open(mode='r', encoding= 'utf-8')
read_ar = ar_path.open(mode='r', encoding='utf-8')

reader_aeropuerto = csv.DictReader(read_aeropuerto)
reader_lagos = csv.DictReader(read_lagos)
reader_conectividad = csv.DictReader(read_conectividad)
reader_resumen_adaptado = csv.DictReader(read_resumen_adaptado)
reader_ar = csv.DictReader(read_ar)

capitales = {}

for line in reader_ar:
    capitales[line['city']] = line['capital']


for line in reader_aeropuerto:
    if line['municipality'] in capitales:
        if capitales[line['municipality']] == 'admin':
            print(line)
        
