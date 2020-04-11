pai(alexandre,nathan).
pai(ninaldo,junior).
pai(junior,naaman).
neto(X,Y) :- pai(X,Z), pai(Z,Y).
avo(X,Y) :- pai(X,Z), pai(Z,Y).
