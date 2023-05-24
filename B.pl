
stringToArray(X,R) :- split_string(X," ","",R).     % convert String to array
arrayToString(X,R) :- atomic_list_concat(X," ",R).  % convert array to String

readInput(I,R) :- read(I), stringToArray(I,R).      % Read input from user

cycle :-  readInput(I,List),                      % Main cicle
          I \= "Adeus",
          pattern(List,R1),
          arrayToString(R1,R),
          write(R),
          nl,
          cycle. 


pattern(["nota",_|C],["tive",N,"e","tu?"]) :- nota(C,N).
pattern(["fizeste",_,T,_|C],R) :- trabalho(T,C,R).


cadeira(["algoritmos"|_],["Sim"],["Não"],["Sim"],["Não"]).
cadeira(["programação","em","lógica"|_],["Ainda","Não"],["Não"],["Estou","a","fazer","agora"],["Sim"]).
cadeira(["inteligência","artificial"|_],["Sim"],["Sim"],["Não"],["Não"]).
cadeira(["sistemas","operativos"|_],["Sim"],["Não"],["Sim"],["Ainda","Não"]).

nota(["algoritmos"|_],"15").
nota(["programação","em","lógica"|_],"20").
nota(["inteligência","artificial"|_],"18").
nota(["sistemas","operativos"|_],"17").

trabalho("trabalho",C,R) :- cadeira(C,R,_,_,_).
trabalho("TPC",C,R):- cadeira(C,_,R,_,_,_).
trabalho("apresentação",C,R):- cadeira(C,_,_,R,_).
trabalho("Quiz",C,R):- cadeira(C,_,_,_,R,_).


changeString([],[]).
changeString([X|L1],[Y|L2]):- change(X,Y),!, changeString(L1,L2).




