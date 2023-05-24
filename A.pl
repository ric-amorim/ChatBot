
stringToArray(X,R) :- split_string(X," ","",R).     % convert String to array
arrayToString(X,R) :- atomic_list_concat(X," ",R).  % convert array to String

readInput(I,R) :- read(I), stringToArray(I,R).      % Read input from user

cycle :-  readInput(I,List),                      % Main cicle
          I \= "Adeus",
          changeString(List,R1),
          arrayToString(R1,R),
          write(R),
          nl,
          cycle. 


change("eu","tu").
change("estou","estás"). 
change(X,X).

changeString([],[]).
changeString([X|L1],[Y|L2]):- change(X,Y),!, changeString(L1,L2).




