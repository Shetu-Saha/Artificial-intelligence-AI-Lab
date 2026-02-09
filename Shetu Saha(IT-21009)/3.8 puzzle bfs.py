from collections import deque
from copy import deepcopy

goal = [[1,2,3],[4,5,6],[7,8,0]]
moves = [(-1,0),(1,0),(0,-1),(0,1)]

def find_blank(s):
    for i in range(3):
        for j in range(3):
            if s[i][j] == 0:
                return i, j

def print_state(s):
    for r in s:
        print(r)
    print()

def bfs(start):
    q = deque()
    visited = set()

    q.append((start, [start]))
    visited.add(str(start))

    while q:
        state, path = q.popleft()

        if state == goal:
            print("✅ Goal Reached\n")
            for lvl, s in enumerate(path):
                print(f"Level {lvl}")
                print_state(s)
            print("Total Levels:", len(path)-1)
            return

        x, y = find_blank(state)
        for dx, dy in moves:
            nx, ny = x+dx, y+dy
            if 0 <= nx < 3 and 0 <= ny < 3:
                new = deepcopy(state)
                new[x][y], new[nx][ny] = new[nx][ny], new[x][y]
                if str(new) not in visited:
                    visited.add(str(new))
                    q.append((new, path + [new]))

initial = [[1,2,3],[4,0,6],[7,5,8]]
bfs(initial)
