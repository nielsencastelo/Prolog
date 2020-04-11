% maior.pl - por Bruno Schneider - NOV/1999

% Este arquivo contém diversos exemplos de predicados que calculam
% o maior elemento de uma lista. Observe o uso do corte para
% simplificar o processamento, possibilitando predicados eficientes
% sem o problema de gerar resultados incorretos por causa do
% backtracking.

% Experimente retirar o corte de alguma funcao. Voce vera que o
% primeiro resultado e' correto, mas forcando o interpretador a
% procurar novas solucoes atraves do backtracking, resultados
% incorretos serao gerados.

% A medida que se observa que alguma coisa pode ser melhorada
% na funcao, outra funcao e' apresentada. Assim, os predicados
% apresentados no final sao considerados melhores (mais eficientes)
% que os do comeco.

% Fazer um predicado que calcule o maior do final para o comeco
% parece estar mais de acordo com a ideia de recursao:

maior1([X],X).
maior1([C|R],C) :-  % o maior de uma lista esta na cabeca se
	maior1(R,MR),   % o elemento da cabeca for maior que o maior do resto
	C >= MR.        % ou ...
maior1([C|R],MR) :- % o maior de uma lista e' o maior do resto se
	maior1(R,MR),   % ele for maior que o da cabeca
	MR > C.

maior2([X],X).
maior2([C|R],C) :-
	maior2(R,MR),
	C >= MR,!.
maior2([_|R],MR) :- % com o corte nao precisamos testar quem e'
	maior2(R,MR).   % o maior entre C e MR novamente

% modificando a funcao para que o maior do resto nao precise ser
% calculado duas vezes

maior3([X],X).
maior3([C|R],Maior) :-       % o maior elemento de uma lista e' o
	maior3(R,MR),            % maior entre a cabeca da lista e o
	maior3_aux(C,MR,Maior).  % maior do resto da lista.
maior3_aux(X,Y,X) :- % o maior entre dois elementos e' o primeiro se
	X >= Y.          % ele for maior ou igual ao segundo, ou...
maior3_aux(X,Y,Y) :- % o maior entre dois elementos e' o segundo se
	Y > X.           % ele for maior maior que o primeiro

maior4([X],X).
maior4([C|R],Maior) :-
	maior4(R,MR),
	maior4_aux(C,MR,Maior).
maior4_aux(X,Y,X) :-
	X >= Y,!.
maior4_aux(_,Y,Y). % com o corte nao precisamos testar que e' o
                   % maior entre X e Y novamente.

% outro jeito de fazer o predicado maior seria testando do comeco
% em direcao ao final, sendo possivel usar recursao de cauda

maior5([X],X).
maior5([N1,N2|R],Maior) :- % o maior de uma lista com pelo menos 2 elementos
	N1 >= N2,              % e' o maior da lista sem o segundo elemento se
	maior5([N1|R],Maior).  % o primeiro for maior que o segundo, ou...
maior5([N1,N2|R],Maior) :- % o maior e' o maior da lista sem o primeiro
	N2 > N1,               % se o segundo for maior que o primeiro.
	maior5([N2|R],Maior).

maior6([X],X).
maior6([N1,N2|R],Maior) :-
	N1 >= N2, !,
	maior6([N1|R],Maior).
maior6([_|R],Maior) :-     % com o corte nao precisamos testar qual o maior
	maior6(R,Maior).       % entre N1 e N2 novamente
