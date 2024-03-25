import random

# Lista de palabras posibles

words = ["python", "programacion", "computadora", "codigo", "desarrollo",
"inteligencia"]

# Elegir una palabra al azar

secret_word = random.choice(words)

# Número máximo de intentos permitidos

max_fails = 10
fails = 0

# Lista para almacenar las letras adivinadas

guessed_letters = []

vowels = ["a", "e", "i", "o", "u"]

print("¡Bienvenido al juego de adivinanzas!")
print("Estoy pensando en una palabra. ¿Puedes adivinar cuál es?")

word_displayed = ""

difficulty = input("En que dificultad deseas jugar? (F)ACIL / (M)EDIO / (D)IFICIL ").upper()

match difficulty:    
    case "F":
        # Construir la palabra parcialmente mostrada con guiones bajos para las consonantes
        for char in secret_word:
            if char in vowels:
                word_displayed += char
            else:
                word_displayed += "_"
        
        # Mostrarla palabra parcialmente adivinada
        
        print(f"Palabra: {word_displayed}")

    case "M":
        word_displayed = secret_word[0]
        
        for char in secret_word[1:-1]:
            word_displayed += "_"

        word_displayed += secret_word[-1]
        
        # Mostrarla palabra parcialmente adivinada
                
        print(f"Palabra: {word_displayed}")
        
    case "D":
        word_displayed = "_" * len(secret_word)
        
        # Mostrarla palabra parcialmente adivinada
        print(f"Palabra: {word_displayed}")
        
while fails < max_fails:
    # Pedir al jugador que ingrese una letra
    letter = input("Ingresa una letra: ").lower()

    # Verificar si es un caracter vacio
    if letter == "":
        print("Caracter invalido. Intenta devuelta.")
        continue
            
    # Verificar si la letra ya ha sido adivinada
    if letter in guessed_letters:
        print("Ya has intentado con esa letra. Intenta con otra.")
        continue
                
    # Agregar la letra a la lista de letras adivinadas

    guessed_letters.append(letter)

    # Verificar si la letra está en la palabra secreta
    
    if letter in secret_word:
        print(f"¡Bien hecho! La letra está en la palabra. Fails: {fails}")
        
    else:
        fails = fails + 1 # Se agrega 1 fail cuando le erra a la letra.
        print(f"Lo siento, la letra no está en la palabra. Fails: {fails}") # Imprime en pantalla los fails para probar si funciona bien.

                
    match difficulty:
        case "F":

            letters = []
            
            # Construir la lista de letras adivinadas en la palabra secreta
            for letter in secret_word:
                if letter in guessed_letters:
                    letters.append(char)
                else:
                    letters.append("_")
                
            # Construir la palabra parcialmente mostrada
            word_displayed = ""
            for letter in secret_word:
                if letter in guessed_letters:
                    word_displayed += letter
                elif letter in vowels:
                    word_displayed += letter
                else:
                    word_displayed += "_"
            print(f"Palabra: {word_displayed}")
            
        case "M":
            letters = []
                
            word_displayed = secret_word[0]
                            
            for letter in secret_word[1:-1]:
                if letter in guessed_letters:
                    letters.append(letter)
                else:
                    letters.append("_")
                
            word_displayed += "".join(letters)
                            
            word_displayed += secret_word[-1]
                                
            print(f"Palabra: {word_displayed}")
        case "D":
            # Mostrar la palabra parcialmente adivinada
            letters = []
            
            for letter in secret_word:
                if letter in guessed_letters:
                    letters.append(letter)
                else:
                    letters.append("_")
                        
            word_displayed = "".join(letters)
            print(f"Palabra: {word_displayed}")
            
            
    # Verificar si se ha adivinado la palabra completa
    if word_displayed == secret_word:
        print(f"¡Felicidades! Has adivinado la palabra secreta: {secret_word}")
        break
        
else:
    print(f"¡Oh no! Has agotado tus {max_fails} intentos.")
    print(f"La palabra secreta era: {secret_word}")
