def GetStats(split_names, goals, goals_avoided, assists):
    stats = tuple(zip(map(str.lower, split_names), goals, goals_avoided, assists))
    return stats


def GetGoleador(stats):
    return max(stats, key=lambda player: player[1])


def GetMostInfluential(stats):
    return max(stats, key=lambda player: player[1] * 1.5 + player[2] * 1.25 + player[3])


def GetGoalsAverage(goals,MATCHES):
    total_goals = sum(goals)
    average = lambda x: x / MATCHES
    return average(total_goals)


def GetGoleadorGoalsAverage(goals_scored,MATCHES):
    average = lambda x: x / MATCHES
    return average(goals_scored)