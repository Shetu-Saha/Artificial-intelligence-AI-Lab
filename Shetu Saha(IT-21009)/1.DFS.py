# 8 Puzzle Problem using DFS

from copy import deepcopy

# Goal state
goal_state = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 0]
]
# Directions: Up, Down, Left, Right
moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]

def find_blank(state):
    for i in range(3):
        for j in range(3):
            if state[i][j] == 0:
                return i, j

def is_goal(state):
    return state == goal_state

def dfs(state, visited, depth, max_depth):
    if is_goal(state):
        print("✅ Goal State Reached!")
        print_state(state)
        return True

    if depth >= max_depth:
        return False

    visited.add(str(state))

    x, y = find_blank(state)

    for dx, dy in moves:
        nx, ny = x + dx, y + dy

        if 0 <= nx < 3 and 0 <= ny < 3:
            new_state = deepcopy(state)
            new_state[x][y], new_state[nx][ny] = new_state[nx][ny], new_state[x][y]

            if str(new_state) not in visited:
                if dfs(new_state, visited, depth + 1, max_depth):
                    return True

    return False

def print_state(state):
    for row in state:
        print(row)
    print()

# Initial state
initial_state = [
    [1, 2, 3],
    [4, 0, 6],
    [7, 5, 8]
]

visited = set()
max_depth = 20   # limit to prevent infinite recursion

dfs(initial_state, visited, 0, max_depth)
