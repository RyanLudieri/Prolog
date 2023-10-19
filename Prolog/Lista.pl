pai(joao,joaquim). 
pai(joao,lucas).
pai(pedro,silvia).
pai(joaquim,bruno).
mae(maria,joaquim).
mae(maria,lucas).
mae(laura,silvia).
mae(silvia,bruno).

avo_paterno(X,Y):-pai(X,Z),pai(Z,Y).
avo_materno(X,Y):-pai(X,Z),mae(Z,Y).
avo_paterna(X,Y):-mae(X,Z),pai(Z,Y).
avo_materna(X,Y):-mae(X,Z),mae(Z,Y).

tem_filho(X):-pai(X,Y).

placar([0,1,2,3,4,5]).

pertence(X,[X|Y]).
pertence(X,[Primeiro|Resto]):-pertence(X,Resto).

ap([],L,L).
ap([X|L1],L2,[X|L3]):-ap(L1,L2,L3).

apaga(X,[X|Y],Y).
apaga(X,[Y|Z],[Y|Z1]):-apaga(X,Z,Z1).

mdc(X,X,X).
mdc(X,Y,D):-X < Y, Y1 is Y- X,mdc(X,Y1,D).
mdc(X,Y,D):-Y < X,mdc(Y,X,D).

maximo(X,[X]).
maximo(X,[Y|R]):- maximo(X,R), X > Y, !.
maximo(Y,[Y|_]).

comprimento(0,[]).
comprimento(X,[_|R]):- comprimento(X1,R), X is 1 + X1.

soma(0,[]).
soma(X,[A|R]):-soma(X1, R), X is X1 + A.

media(X,L):- comprimento(N,L), soma(S,L), X is S/N.

analisa_lista([]):- write('A lista está vazia').
analisa_lista([A|B]):-
write('A cabeça da lista é: '), write(A), nl,
write('A cauda da lista é: '), write(B), nl.


remove_duplicado([],[]).
remove_duplicado([A|B],C) :- pertence(A,B),remove_duplicado(B,C).
remove_duplicado([A|B],[A|C]) :- not(pertence(A,B)),remove_duplicado(B,C).

troca([X|B],X,Y,[Y|C]) :- troca(B,X,Y,C).
troca([A|B],X,Y,[A|C]) :- A \== X, troca(B,X,Y,C).
troca([],_,_,[]).


subconjunto([],[]).
subconjunto([A|B], [A|C]):- subconjunto(B,C).
subconjunto([_|B],C) :- subconjunto(B,C).

longa([],[_|_]).
longa([_|A],[_|B]) :- longa(A,B).

distancia((A,B),(C,D),F) :- 
    S is (C-A)*(C-A)+(D-B)*(D-B), 
    D is sqrt(S).

%exercicio7

linha(0,_) :- nl, !.
linha(N,C) :- write(C), write(' '),N1 is N -1, linha(N1,C), !.

quadro(0,_,_):- !.
quadro(N,M,C) :- linha(M,C),N1 is N-1, quadro(N1,M,C), !.

elemento([A|B],1,A).
elemento([A|B],X,R) :- X1 is X - 1, X1 >=1,elemento(B,X1,R).

min(A,[A]).
min(A, [A|B]):- min(C,B), A < C.
min(C,[A|B]):- min(C,B), A >= C.

intervalo(X,X,[X]).
intervalo(X,Y,[X|C]):- X < Y, X1 is X+1, intervalo(X1,Y,C).

oco(_,[],0).
oco(X,[X|Y],N):- oco(X,Y,N1),N is N1 + 1.
oco(X,[_|Y],N):- oco(X,Y,N).

d(0).
d(1).

reverse(lista,listaInvertida):-reverse(lista,[],listaInvertida)

reverse([],acumulador, acumulador).
reverse([A|B] , acumulador,listaInvertida) :- reverse (B, [A|acumulador], listaInvertida)  

iguais([], []).
iguais([A|B], [A|C]) :- iguais(B, C).

metIguais(Lista):- append(Metade1, Metade2, Lista), iguais(Metade1,Metade2).







