compte([],0).
compte([_|L],N) :- compte(L,N1), N is N1+1.

element(X,[X|_]).
element(X|[Y|L],X) :- X\==Y, element(X,L).

occurence([],_,0).
occurence([X|L],X,N) :- occurence(L,X,N1),N is N1+1.
occurence([Y|L],X,N) :- Y\==N,occurence(L,X,N).

%premiere solution
not(B) :- B,!,fail.
not(B).
enCommun(X,L,M) :- element(X,L),element(X,M).
disjoint(L,M) :- not(enCommun(X,L,M)).

%deuxieme solution
disjoint2(L,M) :- element(X,L),element(X,M),!,fail.

%MAX_LISTE
max(X,Y,Z) :- X>= Y, Z=X,!.
max(X,Y,Z) :- X<Y, Z=Y.

max_Liste([X],X).
max_Liste([Y|L],X) :- max_Liste(L,Z), max(Z,Y,X).

%ajout
ajout_tete(X,L,[X|L]).

ajout_fin(X,[],[X]).
ajout_fin(X,[Y|L1],[Y|L2]) :- ajout_fin(X,L1,L2).

%supprimer
supprimer(_,[],[]).
supprimer(X,[X|L],L):-!.
supprimer(X,[Y|L],[Y|L1]) :- supprimer(X,L,L1).
