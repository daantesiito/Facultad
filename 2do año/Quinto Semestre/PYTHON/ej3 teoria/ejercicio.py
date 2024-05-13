# CODIGO ORIGINAL:

import json
read_dataset = 'Conectividad_Internet.json'
write_dataset = 'Conectividad_Internet_proc.json'

def check_connect(line_proc):
    types=['ADSL','CABLEMODEM','DIALUP','FIBRAOPTICA','SATELITAL','WIRELESS','TELEFONIAFIJA','3G','4G']
    if all(line_proc[key] == '--' for key in types):
        HasConnect = 'NO'
    else:
        HasConnect = 'SI'
    return HasConnect

with open(read_dataset, mode = 'r', encoding = 'utf-8') as read_file:
    write_file = open(write_dataset, mode = 'w', encoding = 'utf-8')
    data = json.load(read_file)
    for record in data:
        record['posee_conectividad'] = check_connect(record)

json.dump(data, write_file, indent=4)
write_file.close()

# --------------------------------------------------------------------------------------------------------------------------------------

# CODIGO MODIFICADO:

import json
read_dataset = 'Conectividad_Internet.json'
write_dataset = 'Conectividad_Internet_proc.json'

def check_connect(line_proc):
    types=['ADSL','CABLEMODEM','DIALUP','FIBRAOPTICA','SATELITAL','WIRELESS','TELEFONIAFIJA','3G','4G']
    # Sacaria el types ya que no se usa para nada.

    if (line_proc['FIBRAOPTICA'] == '--'): # Eliminas el ALL, y el for iterando en todos los 'types'. Luego cambias la llave de busqueda por 'FIBRAOPTICA'.
        HasConnect = 'NO'
    else:
        HasConnect = 'SI'

    return HasConnect

try:
    with open(read_dataset, mode = 'r', encoding = 'utf-8') as read_file:
        write_file = open(write_dataset, mode = 'w', encoding = 'utf-8')
        data = json.load(read_file) # El tipo de dato 'data', es de tipo dict.
        for record in data:
            record['posee_conectividad'] = check_connect(record)
except FileNotFoundError: # Se usa un try-except para que en el caso de que haya un error de que el archivo no existe, imprima lo de abajo y siga la ejecucion.
    print('El archivo no existe.')
except json.JSONDecodeError: # Se usa un try-except para que en el caso de que haya un error de formato de archivo JSON, imprima lo de abajo y siga la ejecucion.
    print('Error en el archivo JSON.')
# Para ejecutar un codigo al final de un try, independientemente de que ocurra, se utiliza un 'FINALLY'.
finally:
    print('Esto se imprime siempre.')

json.dump(data, write_file, indent=4)
write_file.close() # El read_dataset es el path al archivo, la variable que contiene el archivo es el read_file que hay que cerrarlo tambien.
read_file.close()