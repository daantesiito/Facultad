import csv
import pathlib

def tamaño(km: int) -> str:
    if km <= 17:
        return 'chico'
    elif 17 < km <= 59:
        return 'medio'
    else:
        return 'grande'

def convertir_grados(coordenada: str) -> tuple[float, float]:
    partes = coordenada.split(' ')
    if len(partes) != 2:
        raise ValueError("La coordenada no tiene el formato esperado.")
    
    # Función para convertir una parte de la coordenada en grados decimales
    def convertir_parte(parte: str) -> float:
        grados, minutos, segundos, direccion = parte.split('°')
        return float(grados) + float(minutos) / 60 + float(segundos) / 3600 * (-1 if direccion.strip() in ['S', 'O'] else 1)

    latitud = convertir_parte(partes[0])
    longitud = convertir_parte(partes[1])
    
    return latitud, longitud

def crearArchivoNuevo():
    read_dataset = pathlib.Path('../datasets/lagos_arg.csv')
    write_dataset = pathlib.Path('../custom_datasets/lagos_arg.csv')

    with read_dataset.open(mode='r', encoding='UTF-8') as read_file, write_dataset.open(mode='w', encoding='UTF-8') as write_file:
        reader = csv.DictReader(read_file)
        fieldnames = reader.fieldnames + ['Sup Tamaños', 'Latitud', 'Longitud']
        writer = csv.DictWriter(write_file, fieldnames=fieldnames)
        writer.writeheader()

        for line in reader:
            try:
                latitud, longitud = line['Coordenadas'].split(' ')
                line['Latitud'] = convertir_grados(latitud)
                line['Longitud'] = convertir_grados(longitud)
                line['Sup Tamaños'] = tamaño(int(line['Superficie (km²)']))
                writer.writerow(line)
            except Exception as e:
                print(f"Error procesando la línea {line}: {e}")

if __name__ == '__main__':
    crearArchivoNuevo()
