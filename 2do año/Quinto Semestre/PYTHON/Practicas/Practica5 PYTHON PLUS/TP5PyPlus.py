import csv

file_route = "C:/Facultad/2do año/Quinto Semestre/PYTHON/Practicas/Practica5 PYTHON PLUS/area_protegida.csv"

def print_report(title, *args):
    print(f"{title.capitalize():-^40}")
    for elem in args:
        print(f"{elem[0]}: {elem[1]}")

with open(file_route, "r", encoding="utf-8") as data_set:
    reader = csv.reader(data_set)
    header, data = next(reader), list(reader)

my_data = {}

for row in data:
    num = int(row[13]) if row[13]!="" else 0
    if row[8] in my_data:
        my_data[row[8]] += num
    else:
        my_data[row[8]] = num
        
top_rating = sorted(my_data.items(), key=lambda x: x[1], reverse=True)[:5]
print_report("Super listado", top_rating[0], top_rating[1], top_rating[2])