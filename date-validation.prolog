months(X,[X|_]).
months(X,[Y|L]) :- X\==Y,months(X,L).
compris(X,Y,Z) :- X>=Y,X=<Z.
biss(Year) :- mod(Year,4) == 0.

date(Day,Month, Year) :- Year >= 1900,
                        months(Month,[jan,mars,mai,juil,aout,octobre,dec]),
                        compris(Day,1,31).

date(Day,Month, Year) :- Year >= 1900,
                        months(Month,[avril,juin,sept,nouv,decembre]),
                        compris(Day,1,30).

date(Day,fev, Year) :- Year >= 1900, biss(Year), compris(Day,1,29).
date(Day,fev, Year) :- Year >= 1900, compris(Day,1,28).
