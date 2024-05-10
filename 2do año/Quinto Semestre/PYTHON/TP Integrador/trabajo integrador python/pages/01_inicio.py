import streamlit as st
def main():
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
            ### Legajo: 21269/7 \n
            ### DNI: 45284239
            ''')
        
    with Participante3:
        st.write(''' 
            ### Nombre: Emanuel Salmeron \n
            ### Legajo: 21219/6 \n
            ### DNI: 45400320
            ''')
        
    with Participante4:
        st.write('''
            ### Nombre: Juan Segobia \n
            ### Legajo: 19113/6 \n
            ### DNI: 43912027
            ''')

main()