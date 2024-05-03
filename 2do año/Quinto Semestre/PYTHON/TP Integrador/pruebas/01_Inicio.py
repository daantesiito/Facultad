import streamlit as st

st.header('Datos de los participantes')

Participante1, Participante2, Participante3, Participante4 = st.tabs(["Participante 1", "Participante 2", "Participante 3", "Participante 4"])

with Participante1:
    st.write('''
         ### Nombre: Dante Puddu \n
         ### Legajo: 21665/6 \n
         ### DNI: 45913150
         ''')
    
with Participante2:
    st.write('''
         ### Nombre: Tomas Zorzoli \n
         ### Legajo: 21665/6 \n
         ### DNI: 45913150
         ''')
    

    
with Participante3:
    st.write(''' 
         ### Nombre: Emanuel Salmeron \n
         ### Legajo: 21665/6 \n
         ### DNI: 45913150
         ''')
    
with Participante4:
    st.write('''
        ### Nombre: Juan Segobia \n
        ### Legajo: 21665/6 \n
        ### DNI: 45913150
        ''')

st.divider()

radio = st.radio(label="Selecciona una palabra", options=["AM", "FM", "Online"])

st.write(radio)

st.divider()

multiselect = st.multiselect(label="Selecciona una palabra", options=["Tomate", "Palta", "Mayo", "Mostaza", "Ketchup"])

st.write(f"La palabra seleccionada es: {multiselect}")

st.divider()

selectbox = st.selectbox(label="Selecciona una palabra", options=["Tomate", "Palta", "Mayo", "Mostaza", "Ketchup"])

st.write(f"La palabra seleccionada es: {selectbox}")

st.divider()

button = st.checkbox("Presiona el botón")

if button:
    st.write('TOMI CAPOOOOOOOOOOOOOOOOOOOOOOOOOOOOO')

st.divider()

fileup = st.file_uploader("Subí un archivo")

st.divider()

slider = st.slider("Selecciona un número", min_value=0, max_value=100, value=50)

st.divider()

text_area = st.text_area("Escribí algo")

st.divider()

camera_input = st.camera_input("Tomate una foto")

st.divider()

date_input = st.date_input("Selecciona una fecha")

st.divider()

time_input = st.time_input("Selecciona una hora")

st.divider()

color_picker = st.color_picker("Selecciona un color")

st.divider()

number_input = st.number_input("Selecciona un número", min_value=0, max_value=100, value=50)

st.divider()

if "shared" not in st.session_state:
    st.session_state["shared"] = True
  
cambio = st.button('Cambiar valor booleano')

if cambio:
    st.session_state["shared"] = not st.session_state["shared"]
    st.write(f"Valor {st.session_state.shared} despues de presionar el boton")

st.divider()

if "fah" not in st.session_state:
    st.session_state["fah"] = 0

def convertir_cel_fah():
    st.session_state.fah = st.session_state.cel *1.8 +32

celsius = st.number_input("Celsius: ", key="cel", on_change = convertir_cel_fah)

st.write(f"Fahrenheit: {st.session_state.fah}")
    
st.divider()


