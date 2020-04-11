doa(a,a).
doa(a,o).
doa(b,b).
doa(b,o).
doa(ab,a).
doa(ab,b).
doa(ab,ab).
doa(ab,o).
doa(o,o).

doapra(X,Y) :- doa(X,Y).
