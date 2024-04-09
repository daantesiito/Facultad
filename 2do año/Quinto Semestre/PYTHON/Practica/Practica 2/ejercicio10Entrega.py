import funciones

if __name__ == "__main__":
    names = """Agustin, Yanina, Andrés, Ariadna, Bautista, CAROLINA, CESAR, David, Diego, Dolores, DYLAN, ELIANA, Emanuel, Fabián, Noelia, Francsica, FEDERICO, Fernanda, GONZALO, Nancy """
    goals = [0, 10, 4, 0, 5, 14, 0, 0, 7, 2, 1, 1, 1, 5, 6, 1, 1, 2, 0, 11]
    goals_avoided = [0, 2, 0, 0, 5, 2, 0, 0, 1, 2, 0, 5, 5, 0, 1, 0, 2, 3, 0, 0]
    assists = [0, 5, 1, 0, 5, 2, 0, 0, 1, 2, 1, 5, 5, 0, 1, 0, 2, 3, 1, 0]

    split_names = names.split(', ')

    stats = funciones.GetStats(split_names,goals,goals_avoided,assists)

    goleador = funciones.GetGoleador(stats)
    print(f"El jugador con mas goles es: {goleador[0]} con {goleador[1]} goles.")

    influyent = funciones.GetMostInfluential(stats)
    print(f"El jugador mas influyente es: {influyent[0]} con {influyent[1]*1.5+influyent[2]*1.25+influyent[3]} puntos.")

    average = funciones.GetGoalsAverage(goals)
    print(f'El promedio de goles en 25 partidos es de {average}')

    goleador_average = funciones.GetGoleadorGoalsAverage(goleador[1])
    print(f'El promedio de goles del goleador en 25 partidos es de {goleador_average}')