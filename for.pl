for(0,_) :- !.
for(N,_) :- write(N),% fa�a sua a��o aqui,
	NN is N - 1,
	for(NN,_).
