calculo(Area,Altura,Volume, vazio) :- Volume is Area*Altura, Volume<5 .
calculo(Area,Altura,Volume, meio-cheio) :- Volume is Area*Altura, Volume>5,Volume<15.
calculo(Area,Altura,Volume, cheio) :- Volume is Area*Altura,Volume>15.

porcentagem(Volume, P, X, vazio) :- P is (100*Volume)/20, X is 100-(100*Volume)/20,Volume>0,Volume<10.
porcentagem(Volume, P, X,cheio) :- P is 100-(100*Volume)/20 , X is (100*Volume)/20 , Volume<20, Volume>10.
