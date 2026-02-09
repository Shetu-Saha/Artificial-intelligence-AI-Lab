% Tower of Hanoi - prints moves step by step
% Online compiler friendly (no interactive input)

% Base case: move 1 disk
hanoi(1, Source, Target, _) :-
    format('Move disk 1 from ~w to ~w~n', [Source, Target]).

% Recursive case: move N disks
hanoi(N, Source, Target, Auxiliary) :-
    N > 1,
    N1 is N - 1,
    hanoi(N1, Source, Auxiliary, Target),          % Step 1
    format('Move disk ~w from ~w to ~w~n', [N, Source, Target]), % Step 2
    hanoi(N1, Auxiliary, Target, Source).          % Step 3

% Entry point
:- initialization(main).

main :-
    N = 3,  % Change this to the number of disks you want
    write('Tower of Hanoi solution for '), write(N), write(' disks:'), nl,
    hanoi(N, left, right, middle),
    halt.
