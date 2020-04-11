for(0,_) :- !.
for(N,_) :- write(N),% faça sua ação aqui,
	NN is N - 1,
	for(NN,_).
