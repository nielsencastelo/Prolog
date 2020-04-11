caça(fungos, homem).
caça(homem,baleia).
caça(baleia,camarao).
caça(camarao,alga).
caça(alga, plancton).
caça(plancton,luzsol).
caça(luzsol, hidrogenio).
caça(passaro, cobra).
caça(cobra, rato).
caça(rato, inseto).
caça(inseto, planta).
caça(planata, luzsol).

cadeia(X,Y) :- caça(Y,X).
cadeia(X,Y) :- caça(Z,X), cadeia(Z,Y).
