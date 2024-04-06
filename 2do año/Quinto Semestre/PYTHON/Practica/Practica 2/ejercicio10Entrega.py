def GetStats(names, goals, goals_avoided, assists):
    split_names = names.split(', ')
    stats = list(zip(split_names, goals, goals_avoided, assists))
    return stats


def GetGoleador(stats):
    return max(stats, key=lambda player: player[1])


def GetMostInfluential(stats):
    return max(stats, key=lambda player: player[1] + player[2] + player[3])


def GetGoalsAverage(goals):
    total_goals = sum(goals)
    average = lambda x: x / 25
    return average(total_goals)


def GetGoleadorGoalsAverage(goals_scored):
    average = lambda x: x / 25
    return average(goals_scored)

if __name__ == "__main__":
    names = """ Agustin, Yanina, Andrés, Ariadna, Bautista, CAROLINA, CESAR, David, Diego, Dolores, DYLAN, ELIANA, Emanuel, Fabián, Noelia, Francsica, FEDERICO, Fernanda, GONZALO, Nancy """
    goals = [0, 10, 4, 0, 5, 14, 0, 0, 7, 2, 1, 1, 1, 5, 6, 1, 1, 2, 0, 11]
    goals_avoided = [0, 2, 0, 0, 5, 2, 0, 0, 1, 2, 0, 5, 5, 0, 1, 0, 2, 3, 0, 0]
    assists = [0, 5, 1, 0, 5, 2, 0, 0, 1, 2, 1, 5, 5, 0, 1, 0, 2, 3, 1, 0]

    stats = GetStats(names,goals,goals_avoided,assists)

    goleador = GetGoleador(stats)
    print(f"El jugador con mas goles es: {goleador[0]} con {goleador[1]} goles.")

    influyent = GetMostInfluential(stats)
    print(f"El jugador mas influyente es: {influyent[0]} con {influyent[1]} puntos.")

    average = GetGoalsAverage(goals)
    print(f'El promedio de goles en 25 partidos es de {average}')

    goleador_average = GetGoleadorGoalsAverage(goleador[1])
    print(f'El promedio de goles del goleador en 25 partidos es de {goleador_average}')