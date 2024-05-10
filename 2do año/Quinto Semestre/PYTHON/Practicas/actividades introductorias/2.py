'''2. Haz un programa que pida al usuario que ingrese una temperatura en grados Celsius y
luego convierta esa temperatura a grados Fahrenheit, mostrando el resultado'''

celsius = int(input('Ingrese los grados celsius a convertir: '))

farenheit = ((celsius * 1.8) + 32)

print(f'{celsius} grados Celcius son: {farenheit} grados Fahrenheit')
