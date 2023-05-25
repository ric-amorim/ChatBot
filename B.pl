
stringToArray(X,R) :- split_string(X," ","",R).     % convert String to array
arrayToString(X,R) :- atomic_list_concat(X," ",R).  % convert array to String

readInput(I,R) :- read(I), stringToArray(I,R).      % Read input from user

changeString([],[]):- write("não percebi").
changeString(L,R):- pattern(L,R).
changeString([_|L],R):-changeString(L,R).

cadeiras([["algoritmos"],["programação","em","lógica"],
             ["inteligência","artificial"],["sistemas","operativos"]]).

pattern(["nota",_,_|C],["tive",N,"e","tu?"]) :- nota(C,N).
pattern(["tive",N],R) :-quali(N,R).
pattern(["fizeste",_,T,_|C],R) :- trabalho(T,C,R).
pattern(["cadeira"|C],R) :- cadeiras(Y),existe(C,Y,R).

existe(C,[Y|_],["Sim"]):- C==Y.
existe(_,[],["Não"]).
existe(C,[_|L],R):- existe(C,L,R).

nota(["algoritmos"|_],"15").
nota(["programação","em","lógica"|_],"20").
nota(["inteligência","artificial"|_],"18").
nota(["sistemas","operativos"|_],"17").

trabalho("trabalho",C,R) :- cadeira(C,R,_,_,_).
trabalho("TPC",C,R):- cadeira(C,_,R,_,_).
trabalho("apresentação",C,R):- cadeira(C,_,_,R,_).
trabalho("Quiz",C,R):- cadeira(C,_,_,_,R).

tarefas(["algoritmos"|_],["Sim"],["Não"],["Sim"],["Não"]).
tarefas(["programação","em","lógica"|_],["Ainda","Não"],["Não"],["Estou","a","fazer","agora"],["Sim"]).
tarefas(["inteligência","artificial"|_],["Sim"],["Sim"],["Não"],["Não"]).
tarefas(["sistemas","operativos"|_],["Sim"],["Não"],["Sim"],["Ainda","Não"]).

quali(N,["Para","a","próxima","tiras","melhor"]):- atom_number(N,R), R < 10.
quali(N,["Que","bomm!!"]):- atom_number(N,R), R < 16.
quali(N,["WOWW","parabéns!!"]):- atom_number(N,_).


cycle :-  readInput(I,List),                      % Main cicle
          I \= "Adeus",
          changeString(List,R1),
          arrayToString(R1,R),
          write(R),
          nl,
          cycle. 
cycle :- write("Adeus!").


