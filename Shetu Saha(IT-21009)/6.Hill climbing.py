from copy import deepcopy

goal = [[1,2,3],[4,5,6],[7,8,0]]
moves = [(-1,0),(1,0),(0,-1),(0,1)]

def manhattan(s):
    d = 0
    for i in range(3):
        for j in range(3):
            v = s[i][j]
            if v != 0:
                gx, gy = (v-1)//3, (v-1)%3
                d += abs(i-gx) + abs(j-gy)
    return d

def find_blank(s):
    for i in range(3):
        for j in range(3):
            if s[i][j] == 0:
                return i, j

def print_state(s):
    for r in s:
        print(r)
    print()

def hill_climbing(start):
    current = start
    path = [current]

    while True:
        if current == goal:
            print("✅ Goal Reached\n")
            for lvl, s in enumerate(path):
                print(f"Level {lvl}")
                print_state(s)
            print("Total Levels:", len(path)-1)
            return

        x, y = find_blank(current)
        neighbors = []

        for dx, dy in moves:
            nx, ny = x+dx, y+dy
            if 0 <= nx < 3 and 0 <= ny < 3:
                new = deepcopy(current)
                new[x][y], new[nx][ny] = new[nx][ny], new[x][y]
                neighbors.append(new)

        best = min(neighbors, key=manhattan)
        if manhattan(best) >= manhattan(current):
            print("❌ Stuck at Local Minima")
            return

        current = best
        path.append(current)

initial = [[1,2,3],[4,0,6],[7,5,8]]
hill_climbing(initial)
