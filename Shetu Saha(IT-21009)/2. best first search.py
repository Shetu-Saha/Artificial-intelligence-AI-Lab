import heapq
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

def best_first(start):
    pq = []
    visited = set()

    heapq.heappush(pq, (manhattan(start), start, [start]))

    while pq:
        h, state, path = heapq.heappop(pq)

        if state == goal:
            print("✅ Goal Reached\n")
            for lvl, s in enumerate(path):
                print(f"Level {lvl}")
                print_state(s)
            print("Total Levels:", len(path)-1)
            return

        visited.add(str(state))
        x, y = find_blank(state)

        for dx, dy in moves:
            nx, ny = x+dx, y+dy
            if 0 <= nx < 3 and 0 <= ny < 3:
                new = deepcopy(state)
                new[x][y], new[nx][ny] = new[nx][ny], new[x][y]
                if str(new) not in visited:
                    heapq.heappush(pq, (manhattan(new), new, path+[new]))

initial = [[1,2,3],[4,0,6],[7,5,8]]
best_first(initial)
