# AO* Algorithm Implementation

import math

# Graph structure
# Each node: (node_type, children)
# node_type = "OR" or "AND"
# children = list of (child_node, cost)

graph = {
    'A': ('OR',  [('B', 1), ('C', 3)]),
    'B': ('AND', [('D', 1), ('E', 1)]),
    'C': ('OR',  [('F', 5)]),
    'D': ('OR',  []),
    'E': ('OR',  []),
    'F': ('OR',  [])
}

heuristic = {
    'A': 2,
    'B': 1,
    'C': 3,
    'D': 0,
    'E': 0,
    'F': 0
}

solution = {}

def ao_star(node):
    if node not in graph or len(graph[node][1]) == 0:
        solution[node] = []
        return heuristic[node]

    node_type, children = graph[node]

    if node_type == 'OR':
        min_cost = math.inf
        best_child = None

        for child, cost in children:
            total = cost + ao_star(child)
            if total < min_cost:
                min_cost = total
                best_child = child

        solution[node] = [best_child]
        return min_cost

    else:  # AND node
        total_cost = 0
        sol = []

        for child, cost in children:
            total_cost += cost + ao_star(child)
            sol.append(child)

        solution[node] = sol
        return total_cost

start = 'A'
final_cost = ao_star(start)

print("✅ Solution Graph:")
for k, v in solution.items():
    print(f"{k} -> {v}")

print("\nMinimum Cost from Start Node:", final_cost)
