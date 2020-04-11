membro([azul, verde, vermelho, amarelo]).
membro(X,Y) :- Y = [X|_].
membro(X,Y) :- Y = [_|Z], membro(X,Z).
