max_Liste(L,X).
ajout_tete(X,L,L1).
ajout_fin(X,L,L1).
supprimer(X,L,L1).

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
