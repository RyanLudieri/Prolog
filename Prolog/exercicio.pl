mulher(ana).
mulher(eva).
mulher(bia).
mulher(clo).
mulher(lia).
mulher(gal).
mulher(leticia)
homem(ivo).
homem(rai).
homem(noe).
homem(gil).
homem(ary).
homem(junior).
homem(tiao).
homem(rafael).
homem(leo).
homem(yuri).
gerou(junior,ana).
gerou(ana, eva).
gerou(ivo, eva).
gerou(eva, noe).
gerou(rai, noe).
gerou(bia, rai).
gerou(bia, clo).
gerou(bia, ary).
gerou(gil, rai).
gerou(gil, clo).
gerou(gil, ary).
gerou(ary, gal).
gerou(lia, gal).
gerou(junior,tiao).
gerou(junior,leticia).
gerou(junior,rafael).
gerou(leo,ivo).
gerou(leo,yuri).

mae(X,Y):-gerou(X,Y), mulher(X).
pai(X,Y):-gerou(X,Y), homem(X).
avos(X,Y):-gerou(X,Z),gerou(Z,Y).

irmaos(X,Y):-gerou(S,X),gerou(S,Y), X \== Y.

parente(X,Y):- gerou(X,Y).
perente(X,Y):- gerou(X,A),parente(A,Y).

tio(X,Y):-irmaos(X,Z),gerou(Z,Y).

primo(X,Y):-pai(A,Y),tio(A,X).

tios_avo(X,Y):-avos(A,Y),irmaos(A,X).
