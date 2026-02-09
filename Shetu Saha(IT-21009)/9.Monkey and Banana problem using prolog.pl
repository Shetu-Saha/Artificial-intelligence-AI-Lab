:- initialization(main).

% Monkey & Banana Problem - Complete Implementation
% States are represented as: state(MonkeyLocation, BoxLocation, MonkeyOnBox, HasBanana)

% Initial state
initial_state(state(door, window, off, no)).

% Goal state
goal_state(state(_, _, _, yes)).

% Actions

% 1. Move to a location
action(move(From, To), 
       state(From, BoxLoc, off, HasBanana), 
       state(To, BoxLoc, off, HasBanana)) :-
    adjacent(From, To).

% 2. Push box to a location
action(push(From, To), 
       state(From, From, off, HasBanana), 
       state(To, To, off, HasBanana)) :-
    adjacent(From, To).

% 3. Climb on box
action(climb_on, 
       state(Loc, Loc, off, HasBanana), 
       state(Loc, Loc, on, HasBanana)).

% 4. Climb off box
action(climb_off, 
       state(Loc, Loc, on, HasBanana), 
       state(Loc, Loc, off, HasBanana)).

% 5. Grab banana (only when on box under banana)
action(grab, 
       state(banana, banana, on, no), 
       state(banana, banana, on, yes)).

% World layout - adjacency relationships
adjacent(door, window).
adjacent(window, door).
adjacent(window, center).
adjacent(center, window).
adjacent(center, banana).
adjacent(banana, center).

% Planning algorithm using depth-first search
plan(State, []) :-
    goal_state(State).

plan(State, [Action|Plan]) :-
    action(Action, State, NextState),
    plan(NextState, Plan).

% Find a solution
solve(Plan) :-
    initial_state(Initial),
    plan(Initial, Plan).

% Display a plan
display_plan([]).
display_plan([Action|Rest]) :-
    display_action(Action),
    display_plan(Rest).

display_action(move(From, To)) :-
    write('Monkey moves from '), write(From), write(' to '), write(To), nl.
display_action(push(From, To)) :-
    write('Monkey pushes box from '), write(From), write(' to '), write(To), nl.
display_action(climb_on) :-
    write('Monkey climbs onto the box'), nl.
display_action(climb_off) :-
    write('Monkey climbs off the box'), nl.
display_action(grab) :-
    write('Monkey grabs the banana!'), nl.

% Show state
display_state(state(MonkeyLoc, BoxLoc, OnBox, HasBanana)) :-
    write('State:'), nl,
    write('  Monkey at: '), write(MonkeyLoc), nl,
    write('  Box at:    '), write(BoxLoc), nl,
    write('  On box:    '), write(OnBox), nl,
    write('  Has banana: '), write(HasBanana), nl, nl.

% Main program
main :-
    write('============================================'), nl,
    write('    MONKEY & BANANA PROBLEM - AI PLANNING   '), nl,
    write('============================================'), nl, nl,
    
    write('PROBLEM DESCRIPTION:'), nl,
    write('A monkey is in a room with a banana hanging from the ceiling.'), nl,
    write('The monkey cannot reach the banana directly.'), nl,
    write('There is a box in the room that the monkey can use.'), nl, nl,
    
    write('INITIAL STATE:'), nl,
    initial_state(Initial),
    display_state(Initial), nl,
    
    write('GOAL STATE:'), nl,
    goal_state(Goal),
    write('  Monkey has the banana!'), nl, nl,
    
    write('FINDING SOLUTION...'), nl, nl,
    
    % Find and display solution
    (solve(Plan) ->
        write('SOLUTION FOUND!'), nl,
        write('Step-by-step plan:'), nl, nl,
        
        % Number the steps
        enumerate_plan(Plan, 1),
        nl,
        
        write('FINAL RESULT:'), nl,
        write('The monkey successfully gets the banana!'), nl,
        
        % Show alternative solutions
        nl, write('ALTERNATIVE SOLUTIONS:'), nl,
        write('(Backtracking to find all possible plans)'), nl,
        findall(P, solve(P), AllPlans),
        length(AllPlans, Count),
        write('Total possible plans: '), write(Count), nl
    ;
        write('NO SOLUTION FOUND!'), nl
    ),
    
    nl, write('============================================'), nl,
    write('           END OF PROGRAM                    '), nl,
    write('============================================'), nl.

% Helper to number steps
enumerate_plan([], _).
enumerate_plan([Action|Rest], N) :-
    write(N), write('. '),
    display_action(Action),
    NextN is N + 1,
    enumerate_plan(Rest, NextN).

% Test different scenarios
test_scenarios :-
    nl, write('TESTING DIFFERENT SCENARIOS:'), nl, nl,
    
    write('Scenario 1: Monkey at door, box at window'), nl,
    initial_state(S1),
    display_state(S1),
    
    write('Scenario 2: Box already under banana'), nl,
    display_state(state(center, banana, off, no)),
    
    write('Scenario 3: Monkey already on box'), nl,
    display_state(state(center, center, on, no)),
    
    write('Scenario 4: Goal state'), nl,
    display_state(state(banana, banana, on, yes)).