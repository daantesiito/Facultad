def GetStats(stats, names, goals, goals_avoided, assits):
    split_names = names.split(', ')
    for i in range(len(split_names)):
        stats.append((split_names[i], goals[i], goals_avoided[i], assists[i]))


def GetGoleador(stats):
    max_goals = 0
    max_goals_name = ''
    for player in stats:
        if player[1] > max_goals:
            max_goals = player[1]
            max_goals_name = player[0]
    return max_goals_name, max_goals


def GetMostInfluential(stats):
    max_points = 0
    max_points_name = ''
    for player in stats:
        total_points = (player[1] * 1.5) + (player[2] * 1.25) + (player[3])
        if total_points > max_points:
            max_points = total_points
            max_points_name = player[0]
    return max_points_name, max_points


def GetGoalsAverage(goals):
    total_goals = sum(goals)
    average = total_goals / 25
    return average


def GetGoleadorGoalsAverage(goals_scored):
    average = goals_scored / 25
    return average    

if __name__ == "__main__":
    names = """ Agustin, Yanina, Andrés, Ariadna, Bautista, CAROLINA, CESAR, David, Diego, Dolores, DYLAN, ELIANA, Emanuel, Fabián, Noelia, Francsica, FEDERICO, Fernanda, GONZALO, Nancy """
    goals = [0, 10, 4, 0, 5, 14, 0, 0, 7, 2, 1, 1, 1, 5, 6, 1, 1, 2, 0, 11]
    goals_avoided = [0, 2, 0, 0, 5, 2, 0, 0, 1, 2, 0, 5, 5, 0, 1, 0, 2, 3, 0, 0]
    assists = [0, 5, 1, 0, 5, 2, 0, 0, 1, 2, 1, 5, 5, 0, 1, 0, 2, 3, 1, 0]
    stats = []
    GetStats(stats,names,goals,goals_avoided,assists)
    goleador = GetGoleador(stats)
    print(f"El jugador con mas goles es: {goleador[0]} con {goleador[1]} goles.")
    influyent = GetMostInfluential(stats)
    print(f"El jugador mas influyente es: {influyent[0]} con {influyent[1]} puntos.")
    average = GetGoalsAverage(goals)
    print(f'El promedio de goles en 25 partidos es de {average}')
    goleador_average = GetGoleadorGoalsAverage(goleador[1])
    print(f'El promedio de goles del goleador en 25 partidos es de {goleador_average}')