%First pattern 
nota(["algoritmos?"|_],"15").
nota(["programação","em","lógica?"|_],"20").
nota(["inteligência","artificial?"|_],"18").
nota(["sistemas","operativos?"|_],"17").

% Second pattern
quali(N,["Para","a","próxima","tiras","melhor"]):- atom_number(N,R), R < 10.
quali(N,["Que","bomm!!"]):- atom_number(N,R), R < 16.
quali(N,["WOWW","parabéns!!"]):- atom_number(N,_).

% Third pattern
trabalho("trabalho",C,R) :- tarefas(C,R,_,_,_).
trabalho("TPC",C,R):- tarefas(C,_,R,_,_).
trabalho("apresentação",C,R):- tarefas(C,_,_,R,_).
trabalho("Quiz",C,R):- tarefas(C,_,_,_,R).

tarefas(["algoritmos?"|_],["Sim"],["Não"],["Sim"],["Não"]).
tarefas(["programação","em","lógica?"|_],["Ainda","Não"],["Não"],["Estou","a","fazer","agora"],["Sim"]).
tarefas(["inteligência","artificial?"|_],["Sim"],["Sim"],["Não"],["Não"]).
tarefas(["sistemas","operativos?"|_],["Sim"],["Não"],["Sim"],["Ainda","Não"]).

% Fourth pattern
cadeiras([["algoritmos?"],["programação","em","lógica?"],
             ["inteligência","artificial?"],["sistemas","operativos?"]]).

existe(C,[Y|_],["Sim"]):- C==Y.
existe(_,[],["Não"]).
existe(C,[_|L],R):- existe(C,L,R).

% main pattern function
pattern(["nota",_,_|C],["tive",N,"e","tu?"]) :- nota(C,N). %input ask what grade the program got
pattern(["tive",N],R) :-quali(N,R). % input says what grade he got
pattern(["fizeste",_,T,_|C],R) :- trabalho(T,C,R). % input ask if the program did some kinda of work
pattern(["cadeira"|C],R) :- cadeiras(Y),existe(C,Y,R). % input ask if the program have the curricular unit

% see if exist pattern in the input list
changeString([],[]):- write("não percebi").
changeString(L,R):- pattern(L,R).
changeString([_|L],R):-changeString(L,R).

% function to read input and convert String/array AND array/String
readInput(I,R) :- read(I), stringToArray(I,R).      % Read input from user
stringToArray(X,R) :- split_string(X," ","",R).     % convert String to array
arrayToString(X,R) :- atomic_list_concat(X," ",R).  % convert array to String

%main function
cycle :-  readInput(I,List),      % get input from user  
          I \= "Adeus",           % if its "Adeus" finish
          changeString(List,R1),  % check if the input have a pattern
          arrayToString(R1,R),    
          write(R),               % print the output
          nl,
          cycle. 
cycle :- write("Adeus!").


