
% 17. Pattern Matching
pattern_match([], []).
pattern_match([_ | T1], [_ | T2]) :- pattern_match(T1, T2).
pattern_match([H1 | T1], [H2 | T2]) :- H1 == H2, pattern_match(T1, T2).

% 18. Count Vowels
count_vowels([], 0).
count_vowels([H|T], Count) :-
    is_vowel(H),
    count_vowels(T, Rest),
    Count is Rest + 1.
count_vowels([H|T], Count) :-
    \+ is_vowel(H),
    count_vowels(T, Count).

is_vowel(a).
is_vowel(e).
is_vowel(i).
is_vowel(o).
is_vowel(u).

% 19. Sum Integers 1 to N
sum(1, 1).
sum(N, Total) :-
    N > 1,
    N1 is N - 1,
    sum(N1, T1),
    Total is T1 + N.

% 20. DB with Name and DOB
person(john, '1990-01-01').
person(alice, '1995-03-15').
person(bob, '2001-12-30').
get_dob(Name, DOB) :- person(Name, DOB).

% 21. Student-Teacher-Sub-Code
teaches(teacher1, student1, cs101).
teaches(teacher2, student2, cs102).
teaches(teacher1, student3, cs101).
find_teacher(Student, Subject, Teacher) :- teaches(Teacher, Student, Subject).

% 22. Planets DB
planet(mercury, 0.39).
planet(venus, 0.72).
planet(earth, 1.00).
planet(mars, 1.52).
distance_from_sun(Planet, Distance) :- planet(Planet, Distance).

% 23. Towers of Hanoi
move(1, X, Y, _) :- write('Move disk from '), write(X), write(' to '), write(Y), nl.
move(N, A, B, C) :-
    N > 1,
    M is N - 1,
    move(M, A, C, B),
    move(1, A, B, C),
    move(M, C, B, A).

% 24. Bird can fly or not
bird(sparrow).
bird(pigeon).
bird(penguin).
can_fly(X) :- bird(X), \+ flightless(X).
flightless(penguin).

% 25. Family Tree
parent(john, mary).
parent(john, bob).
parent(mary, alice).
male(john).
male(bob).
female(mary).
female(alice).
father(X,Y) :- parent(X,Y), male(X).
mother(X,Y) :- parent(X,Y), female(X).

% 26. Diet Suggestion
disease_diabetes(low_sugar_food).
disease_bp(low_sodium_diet).
disease_obesity(low_carb_diet).
diet(diabetes, X) :- disease_diabetes(X).
diet(bp, X) :- disease_bp(X).
diet(obesity, X) :- disease_obesity(X).

% 27. Monkey and Banana Problem
has_box(monkey).
climb(monkey, box).
move(box, under_banana).
grasp(monkey, banana).
can_reach(monkey, banana) :-
    has_box(monkey),
    climb(monkey, box),
    move(box, under_banana),
    grasp(monkey, banana).

% 28. Fruit and Color (Backtracking)
fruit(apple, red).
fruit(banana, yellow).
fruit(grape, green).
fruit(orange, orange).

% 29. Best First Search (Simplified)
edge(a, b, 1).
edge(a, c, 3).
edge(b, d, 1).
edge(c, d, 1).
best_first_search(Start, Goal, [Start|Path]) :- search([Start], Goal, [], Path).
search([Goal|_], Goal, Visited, Visited).
search([Node|Rest], Goal, Visited, Path) :-
    findall(X, edge(Node, X, _), Children),
    append(Children, Rest, NewFrontier),
    search(NewFrontier, Goal, [Node|Visited], Path).

% 30. Medical Diagnosis
has_symptom(john, fever).
has_symptom(john, cough).
has_symptom(john, fatigue).
disease(john, flu) :-
    has_symptom(john, fever),
    has_symptom(john, cough),
    has_symptom(john, fatigue).

% 31. Forward Chaining
fact(a).
fact(b).
rule(c) :- fact(a), fact(b).

% 32. Backward Chaining
goal(x) :- subgoal1, subgoal2.
subgoal1 :- fact1.
subgoal2 :- fact2.
fact1.
fact2.
