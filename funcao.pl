f(X,0) :- X<5, !.                                 % cláusula 1
f(X,1) :- X>=5, X=<9, !.                          % cláusula 2
f(X,2) :- X>9.
