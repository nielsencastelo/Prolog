enfermo_de(manuel,gripe).
tem_sintoma(alicia,cansaco).
sintoma_de(febre, gripe).
sintoma_de(tossir,gripe).
sintoma_de(cansaco,anemia).
elimina(vitaminas,cansaco).
elimina(aspirina,febre).
elimina(xarope,tossir).

receitar(X,Y) :- enfermo_de(Y,A),alivia(X,A).
alivia(X,Y) :- elimina(X,A),sintoma_de(A,Y).

%enfermo_de(X,Y) := tem_sintoma(X,Y),sintoma_de(Z,Y).
