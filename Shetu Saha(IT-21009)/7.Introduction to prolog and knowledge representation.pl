% STATIC FACTS - compile-time e defined
person(john).
person(sara).
person(ali).
father(john, mike).
father(john, lisa).
mother(sara, mike).
mother(sara, lisa).
age(john, 45).
age(sara, 42).
age(mike, 20).
student(mike).
student(lisa).

% STATIC RULES
parent(X, Y) :- father(X, Y).
parent(X, Y) :- mother(X, Y).
sibling(X, Y) :- 
    parent(Z, X), 
    parent(Z, Y), 
    X \= Y.
adult(X) :- 
    person(X), 
    age(X, Age), 
    Age >= 18.

main :-
    write('== PROLOG KNOWLEDGE REPRESENTATION DEMO =='), nl, nl,
    
    write('1. KNOWLEDGE BASE CREATED:'), nl,
    write('   Facts stored in memory.'), nl, nl,
    
    write('2. QUERYING FACTS:'), nl,
    write('   Is John a person? '),
    (person(john) -> write('Yes') ; write('No')), nl,
    write('   Who are all people? '),
    findall(X, person(X), People),
    write(People), nl, nl,
    
    write('3. RULES AND INFERENCE:'), nl,
    write('   Rules already defined at compile time:'), nl,
    write('   parent(X,Y) :- father(X,Y).'), nl,
    write('   parent(X,Y) :- mother(X,Y).'), nl,
    write('   sibling(X,Y) :- parent(Z,X), parent(Z,Y), X \\= Y.'), nl,
    write('   adult(X) :- person(X), age(X,Age), Age >= 18.'), nl, nl,
    
    write('4. LOGICAL INFERENCE EXAMPLES:'), nl,
    
    write('   a) Who are parents of Mike? '),
    findall(P, parent(P, mike), Parents),
    write(Parents), nl,
    
    write('   b) Are Mike and Lisa siblings? '),
    (sibling(mike, lisa) -> write('Yes') ; write('No')), nl,
    
    write('   c) Who are adults? '),
    findall(A, adult(A), Adults),
    write(Adults), nl,
    
    write('   d) Backtracking example - All parent-child pairs:'), nl,
    forall(parent(P, C), 
           (write('      '), write(P), write(' -> '), write(C), nl)),
    
    nl, write('== END OF DEMO =='), nl.

% Initialize the program
:- initialization(main).