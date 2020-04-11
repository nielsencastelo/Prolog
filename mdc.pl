mdc(X,0,Z) :- Z= X,!.
mdc(X,W,Y) :- H is X mod W, mdc(W,H,Y).

