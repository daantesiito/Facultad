def GetStats(names, goals, goals_avoided, assists):
    stats = tuple(zip(names, goals, goals_avoided, assists))
    return stats


def GetGoleador(stats):
    return max(stats, key=lambda player: player[1])


def GetMostInfluential(stats):
    return max(stats, key=lambda player: player[1] * 1.5 + player[2] * 1.25 + player[3])


def GetGoalsAverage(goals):
    total_goals = sum(goals)
    average = lambda x: x / 25
    return average(total_goals)


def GetGoleadorGoalsAverage(goals_scored):
    average = lambda x: x / 25
    return average(goals_scored)
