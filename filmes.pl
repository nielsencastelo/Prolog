% filme(T�tulo, G�nero, Ano, Dura��o)
  filme('Uma linda mulher', romance,  1990, 119).
  filme('Sexto sentido',    suspense, 2001, 108).
  filme('A cor p�rpura',    drama,    1985, 152).
  filme('Copacabana',       com�dia,  2001,  92).
  filme('E o vento levou',  drama,    1939, 233).
  filme('Carrington',       romance,  1995, 130).

cl�ssico(T,G,A,D) :- filme(T,G,A,D), A =< 1985.

cl�ssico(T,G) :- filme(T,G,A,_), A =< 1985.
