:- initialization(main).

main :-
    write('=== PRACTICAL ARITHMETIC IN PROLOG ==='), nl, nl,
    
    % Basic Arithmetic Operations
    write('1. BASIC ARITHMETIC OPERATIONS:'), nl,
    
    A is 10 + 5,
    write('   10 + 5 = '), write(A), nl,
    
    B is 20 - 8,
    write('   20 - 8 = '), write(B), nl,
    
    C is 6 * 7,
    write('   6 * 7 = '), write(C), nl,
    
    D is 45 / 9,
    write('   45 / 9 = '), write(D), nl,
    
    E is 17 mod 5,
    write('   17 mod 5 = '), write(E), nl,
    
    F is 2 ** 8,
    write('   2^8 = '), write(F), nl, nl,
    
    % Integer vs Float
    write('2. INTEGER VS FLOAT ARITHMETIC:'), nl,
    
    G is 10 / 3,
    write('   10 / 3 = '), write(G), nl,
    
    H is 10 // 3,
    write('   10 // 3 (integer division) = '), write(H), nl,
    
    I is float(10) / 3,
    write('   float(10) / 3 = '), write(I), nl, nl,
    
    % Arithmetic Comparisons
    write('3. ARITHMETIC COMPARISONS:'), nl,
    
    (5 + 3 =:= 8 -> write('   5 + 3 =:= 8 is true') ; write('   false')), nl,
    (5 + 3 =\= 7 -> write('   5 + 3 =\\= 7 is true') ; write('   false')), nl,
    (10 > 5 -> write('   10 > 5 is true') ; write('   false')), nl,
    (5 < 10 -> write('   5 < 10 is true') ; write('   false')), nl,
    (10 >= 10 -> write('   10 >= 10 is true') ; write('   false')), nl,
    (5 =< 5 -> write('   5 =< 5 is true') ; write('   false')), nl, nl,
    
    % Mathematical Functions
    write('4. MATHEMATICAL FUNCTIONS:'), nl,
    
    J is abs(-15),
    write('   abs(-15) = '), write(J), nl,
    
    K is sqrt(49),
    write('   sqrt(49) = '), write(K), nl,
    
    L is round(3.14159),
    write('   round(3.14159) = '), write(L), nl,
    
    M is floor(4.7),
    write('   floor(4.7) = '), write(M), nl,
    
    N is ceiling(4.2),
    write('   ceiling(4.2) = '), write(N), nl,
    
    O is log(100),
    write('   log(100) = '), write(O), nl,
    
    Pi is 3.14159265359,
    Angle is 90 * Pi / 180,
    P is sin(Angle),  % 90 degrees in radians
    write('   sin(90 degrees) = '), write(P), nl, nl,
    
    % Practical Examples
    write('5. PRACTICAL EXAMPLES:'), nl,
    
    % Area of circle
    Radius = 7,
    Area is 3.14159 * Radius * Radius,
    write('   Area of circle (radius 7) = '), write(Area), nl,
    
    % Celsius to Fahrenheit
    Celsius = 25,
    Fahrenheit is (Celsius * 9/5) + 32,
    write('   25 Celsius in Fahrenheit = '), write(Fahrenheit), nl,
    
    % Compound Interest
    Principal = 1000,
    Rate = 5,  % 5%
    Time = 3,  % years
    Amount is Principal * (1 + Rate/100) ** Time,
    write('   Compound interest (1000 at 5% for 3 years) = '), write(Amount), nl,
    
    % BMI Calculation
    Weight = 70,  % kg
    Height = 1.75, % meters
    BMI is Weight / (Height * Height),
    write('   BMI (70kg, 1.75m) = '), write(BMI), nl, nl,
    
    % Arithmetic with Variables
    write('6. ARITHMETIC WITH VARIABLES:'), nl,
    
    X = 10,
    Y = 3,
    Z is X * Y + 5,
    write('   If X=10, Y=3 then X*Y+5 = '), write(Z), nl,
    
    % Generate arithmetic sequences
    write('   Multiplication table of 7: '), nl,
    forall(between(1, 5, I), 
           (Result is 7 * I,
            write('     7 * '), write(I), write(' = '), write(Result), nl)), nl,
    
    % Sum of numbers 1 to 10 (manual calculation)
    write('   Sum of numbers 1 to 10: '),
    sum_1_to_10(Sum),
    write(Sum), nl,
    
    % Average calculation (manual)
    write('   Average of [10,20,30,40,50]: '),
    List = [10, 20, 30, 40, 50],
    average(List, Avg),
    write(Avg), nl, nl,
    
    write('=== END OF ARITHMETIC DEMO ==='), nl.

% Helper predicate for sum 1 to 10
sum_1_to_10(Sum) :-
    sum_1_to_10_helper(1, 0, Sum).

sum_1_to_10_helper(11, Sum, Sum) :- !.
sum_1_to_10_helper(N, Acc, Sum) :-
    NewAcc is Acc + N,
    Next is N + 1,
    sum_1_to_10_helper(Next, NewAcc, Sum).

% Helper predicate for average
average(List, Avg) :-
    average_helper(List, 0, 0, Avg).

average_helper([], Sum, Count, Avg) :-
    Avg is Sum / Count.
average_helper([H|T], Sum, Count, Avg) :-
    NewSum is Sum + H,
    NewCount is Count + 1,
    average_helper(T, NewSum, NewCount, Avg).