import streamlit as st  
import json  
import pathlib
# Esta libreria la utilizamos para validar que el campo de email, sea valido.
import re
from datetime import datetime

def is_valid_email(email):
    # Utiliza una expresión regular para verificar si la cadena parece una dirección de correo electrónico válida
    return re.match(r"[^@]+@[^@]+\.[^@]+", email)

# Comprobamos si existe un diccionario de usuarios en el estado de la sesión
if "users" not in st.session_state:
    st.session_state["users"] = {}  # Si no existe, lo inicializamos como un diccionario vacío

# Cargar datos de usuarios desde el archivo si existe
ruta = pathlib.Path("./data_users/users.json")
if ruta.exists():
    with open(ruta, "r") as f:
        try:
            st.session_state["users"] = json.load(f)
        except json.JSONDecodeError:
            # Si hay un error al cargar el archivo (por estar vacío o tener un formato incorrecto), inicializamos como un diccionario vacío
            st.session_state["users"] = {}

username = st.text_input('Ingrese su nombre de usuario:')
name = st.text_input('Ingrese su nombre:')
mail = st.text_input('Ingrese su mail:')
birth_date = st.date_input('Ingrese su fecha de nacimiento:', min_value= datetime(1924, 1, 1), max_value= datetime.now())
gender = st.radio('Seleccione su género:', ('Masculino', 'Femenino', 'Otro'))
if gender == "Otro":
    gender = st.text_input('Ingrese su genero')

col1, col2, col3, col4 = st.columns([1, 2, 3, 1]) # columnas para centrar el boton
with col3:
    button = st.button('Enviar')

if button:
    if not is_valid_email(mail):
        st.error("Direccion de correo no valida")
    else:
        # Verificamos si el correo electrónico proporcionado ya está en la lista de usuarios
        if mail in st.session_state["users"]:
            # Si el usuario ya existe, actualizamos su información
            st.session_state["users"][mail] = {
                "username": username,
                "name": name,
                "birth_date": str(birth_date),
                "gender": gender
            }
            st.success(f"Los datos para el correo electrónico {mail} han sido actualizados.")
        else:
            # Si el usuario no existe, creamos una nueva entrada en el diccionario de usuarios
            user_data = {
                "username": username,
                "name": name,
                "birth_date": str(birth_date),
                "gender": gender
            }
            st.session_state["users"][mail] = user_data
            st.success(f"Los datos para el correo electrónico {mail} han sido guardados.")

# Guardar datos de usuarios en el archivo
with open(ruta, "w") as f:
    json.dump(st.session_state["users"], f, indent=4)
