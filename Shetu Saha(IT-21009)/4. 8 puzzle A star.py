import heapq
from copy import deepcopy

goal = [[1,2,3],[4,5,6],[7,8,0]]
moves = [(-1,0),(1,0),(0,-1),(0,1)]

def find_blank(state):
    for i in range(3):
        for j in range(3):
            if state[i][j] == 0:
                return i, j

def manhattan(state):
    dist = 0
    for i in range(3):
        for j in range(3):
            val = state[i][j]
            if val != 0:
                gx = (val - 1) // 3
                gy = (val - 1) % 3
                dist += abs(i - gx) + abs(j - gy)
    return dist

def print_state(state):
    for row in state:
        print(row)
    print()

def a_star(start):
    pq = []
    visited = set()

    # (f, g, state, path)
    heapq.heappush(pq, (manhattan(start), 0, start, [start]))

    while pq:
        f, g, state, path = heapq.heappop(pq)

        if state == goal:
            print("✅ Goal State Reached\n")
            print("Solution Path:\n")

            for level, s in enumerate(path):
                print(f"Level {level}")
                print_state(s)

            print("Total Levels:", len(path) - 1)
            return

        visited.add(str(state))
        x, y = find_blank(state)

        for dx, dy in moves:
            nx, ny = x + dx, y + dy
            if 0 <= nx < 3 and 0 <= ny < 3:
                new_state = deepcopy(state)
                new_state[x][y], new_state[nx][ny] = new_state[nx][ny], new_state[x][y]

                if str(new_state) not in visited:
                    h = manhattan(new_state)
                    heapq.heappush(
                        pq,
                        (g + 1 + h, g + 1, new_state, path + [new_state])
                    )

# Initial State
initial_state = [
    [1, 2, 3],
    [4, 0, 6],
    [7, 5, 8]
]

a_star(initial_state)
