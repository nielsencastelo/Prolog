ca�a(fungos, homem).
ca�a(homem,baleia).
ca�a(baleia,camarao).
ca�a(camarao,alga).
ca�a(alga, plancton).
ca�a(plancton,luzsol).
ca�a(luzsol, hidrogenio).
ca�a(passaro, cobra).
ca�a(cobra, rato).
ca�a(rato, inseto).
ca�a(inseto, planta).
ca�a(planata, luzsol).

cadeia(X,Y) :- ca�a(Y,X).
cadeia(X,Y) :- ca�a(Z,X), cadeia(Z,Y).
