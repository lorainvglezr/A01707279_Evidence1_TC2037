%Definition of data base
displace(q0, q1, k).
displace(q1, q2, a).
displace(q2, q4, l).
displace(q4, qf, a). 
displace(q2, q5, r). 
displace(q5, q8, a).
displace(q8, q9, m).
displace(q9, qf, a).
displace(q2, q6, v). 
displace(q6, q10, e).
displace(q10, qf, h).
displace(q2, q7, y).
displace(q7, q11, m).
displace(q11, q12, u). 
displace(q12, qf, n).
displace(q1, q3, e).
displace(q3, q13, t).
displace(q13, q14, m).
displace(q14, q15, a).
displace(q15, qf, n).


%Specify the automaton's final state (accepting state)
final_state(qf).

%Set initial state and pass it to the next function
journey_automaton(Term):-
    correction_agent(Term, q0).

%Base case, the entire word is checked and verifies if it ends in an accepted state
correction_agent([], Initial_state):-
    final_state(Initial_state).

%Function that continues while the list contains elements
correction_agent([Word_letter | Word_tail], Initial_state):-
    displace(Initial_state, Next_step, Word_letter),
    correction_agent(Word_tail, Next_step).


%Several test cases
kala:-
    write('kala'), nl,
    write('Automaton travel: TRUE'), nl,
    journey_automaton([k, a, l, a]).

kasa:-
    write('kasa'), nl,
    write('Automaton travel: FAIL'), nl,
    journey_automaton([k, a, s, a]).

karama:-
    write('karama'), nl, 
    write('Automaton travel: TRUE'), nl,
    journey_automaton([k, a, r, a, m, a]).

kebab:-
    write('kebab'), nl,
    write('Automaton travel: FAIL'), nl,
    journey_automaton([k, e, b, a, b]).

kaveh:-
    write('kaveh'), nl, 
    write('Automaton travel: FAIL'), nl,
    journey_automaton([k, a, v, e, h]).

kale:-
    write('kale'), nl,
    write('Automaton travel: FAIL'), nl,
    journey_automaton([k, a, l, e]).

kaymun:-
    write('kaymun'), nl, 
    write('Automaton travel: TRUE'), nl,
    journey_automaton([k, a, y, m, u, n]).

kangaroo:-
    write('kangaroo'), nl,
    write('Automaton travel: FAIL'), nl,
    journey_automaton([k, a, n, g, a, r, o, o]).

ketman:-
    write('ketman'), nl, 
    write('Automaton travel: TRUE'), nl,
    journey_automaton([k, e, t, m, a, n]).

kesha:-
    write('kesha'), nl,
    write('Automaton travel: FAIL'), nl,
    journey_automaton([k, e, s, h, a]).
