pai(arthur, silvio).
pai(arthur, carlos).
pai(carlos, xico).
pai(silvio, ricardo).
avo(X,Z) :- pai(X,Y), pai(Y,Z).
