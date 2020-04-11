% arquivo2.pl  (C) Bruno de Oliveira Schneider - DCC - UFLA
% versao de dezembro de 2009

% Este programa le um arquivo (arquivo2.in) com varios numeros em varias linhas
% e escreve outro arquivo (arquivo2.out) onde cada linha contem a soma e a subtracao
% dos valores da linha correspondente em arquivo2.in

% O Prolog tem funcoes de alto nivel somente para ler termos de Prolog. Se temos uma
% entrada que nao segue as regras de sintaxe da linguagem, a leitura deve ser feita
% caracter por caracter. Este programa serve de exemplo para a leitura caracter por caracter.

% Se voce for fazer a leitura do teclado, sinalize o final dos dados com um Ctrl-D (no Linux).

% Para executar o programa, chame: goal.

goal :-
    arquivo_para_lista('arquivo2.in', ListaEntrada),
    soma_e_subtrai_listas(ListaEntrada, ListaSaida),
    lista_para_arquivo(ListaSaida, 'arquivo2.out').

% -- PREDICADOS PARA ENTRADA DE DADOS ----------------------------------------------

%arquivo_para_lista(+NomeDoArquivo, -ListaDeNumeros)
% ListaDeNumeros e' uma lista de listas de numeros. Cada linha do arquivo corresponde
% a uma lista em ListaDeNumeros.
arquivo_para_lista(NomeArquivo, ListaDeNumeros) :-
    see(NomeArquivo), % abre o arquivo (o arquivo passa a ser a entrada padrao)
    arquivo_para_lista_aux([], ListaDeNumeros),
    seen. % fecha o arquivo

%arquivo_para_lista_aux(+ListaParcialDeNumeros, -ListaDeNumeros)
% Este predicado le a entrada toda, acumulando cada linha da entrada numa lista de numeros.
% Na lista de numeros, cada linha da entrada corresponde a uma lista de numeros.
arquivo_para_lista_aux(ListaParc, Lista) :-
    linha_para_lista(ListaLinha), !,
    append(ListaParc, [ListaLinha], NovaListaParc),
    arquivo_para_lista_aux(NovaListaParc, Lista).
arquivo_para_lista_aux(Lista, Lista).

%linha_para_lista(-Lista)
% Faz a leitura de uma linha da entrada padrao e coloca os valores lidos em Lista.
linha_para_lista(Lista) :-
    linha_para_lista_aux([], ListaString),
    string_para_numeros(ListaString,Lista).

%linha_para_lista_aux(+ListaParcialDeCaracteres, -ListaDeStrings)
linha_para_lista_aux(ListaParc, Lista) :-
    get0(Letra),
    Letra \= -1,    % continuar somente se a entrada nao acabou
    Letra \= 10, !, % continuar somente se a linha nao acabou
    append(ListaParc, [Letra], NovaListaParc),
    linha_para_lista_aux(NovaListaParc, Lista).
linha_para_lista_aux([C|R], [C|R]). % temos que garantir que a lista nao e' vazia

%string_para_numeros(+String, -Numeros)
% Converte uma string (ex. "12 3.4") numa lista de numeros (ex. [12,3.4])
string_para_numeros(String, Numeros) :-
    string_para_numeros_aux(String, [], [], Numeros).

%string_para_numeros_aux(+String, +ListaParcialDeDigitos, +ListaParcialDeNumero, -ListaDeNumeros)
string_para_numeros_aux([], ListaDigitosParc, ListaNumerosParc, ListaNumeros) :-
    % caso: fim da string; converte os digitos num atomo
    string_to_atom(ListaDigitosParc, SimboloNumero),
    % coverte o atomo num numero
    atom_to_term(SimboloNumero, Numero, _),
    % a lista de numeros e' a lista parcial de numeros com o ultimo numero no final
    append(ListaNumerosParc, [Numero], ListaNumeros).
string_para_numeros_aux([32|RDig], ListaDigitosParc, ListaNumerosParc, ListaNumeros) :- !,
    % caso: espaco (final de um numero); converte os digitos num atomo
    string_to_atom(ListaDigitosParc, SimboloNumero),
    % converte o atomo num numero
    atom_to_term(SimboloNumero, Numero, _),
    % a nova lista parcial de numeros e' a lista parcial com esse novo numero no final
    append(ListaNumerosParc, [Numero], NovaListaNumerosParc),
    % processar o resto, acumulando
    string_para_numeros_aux(RDig, [], NovaListaNumerosParc, ListaNumeros).
string_para_numeros_aux([Dig|RDig], ListaDigitosParc, ListaNumerosParc, ListaNumeros) :-
    % caso: mais uma parte de um numero
    append(ListaDigitosParc, [Dig], NovaListaDigParc),
    string_para_numeros_aux(RDig, NovaListaDigParc, ListaNumerosParc, ListaNumeros).

% -- PREDICADOS DE PROCESSAMENTO ---------------------------------------------------

% soma(+ListaDeNumeros, -Soma)
% Calcula a soma dos elementos de uma lista.
soma([],0).
soma([C|R],S) :-
    soma(R, SR),
    S is C + SR.

% subtrai(+ListaDeNumeros, -Sobra)
% Calcula a subtracao dos elementos de uma lista, ou seja, o primeiro menos o segundo, menos
% o terceiro, menos o quarto, etc...
subtrai([],0).
subtrai([X],-X) :- !.
subtrai([A,B],X) :- !,
    X is A - B.
subtrai([A,B|R],X) :-
    C is A - B,
    subtrai([C|R],X).

% soma_e_subtrai(+ListaDeNumeros, -Resultado)
% Encontra a soma e a subtracao dos elementos de uma lista.
soma_e_subtrai(Lista, [Soma, Subtracao]) :-
    soma(Lista, Soma),
    subtrai(Lista, Subtracao).

% soma_e_subtrai_listas(+Entrada, -Saida)
% Entrada e' uma lista de lista de numeros
% Saida e' uma lista de listas tal que cada lista interna tem a soma e a subtracao
% dos elementos da lista correspondente da entrada.
soma_e_subtrai_listas([],[]).
soma_e_subtrai_listas([C|R],[SSC|SSR]) :-
    soma_e_subtrai(C, SSC), % SSC e' a soma e a subtracao dos elementos de C
    soma_e_subtrai_listas(R, SSR). % SSR e' a soma e a subtracao de R

% -- PREDICADOS PARA SAIDA DE DADOS ------------------------------------------------

% lista_para_arquivo(+Lista, +NomeArquivo)
% Lista e' uma lista de listas. Este predicado escreve Lista no arquivo indicado, de tal
% forma que cada lista interna de Lista corresponda a uma linha no arquivo.
lista_para_arquivo(Lista, NomeArquivo) :-
    tell(NomeArquivo), % abre o arquivo (o arquivo passa a ser a saida padrao)
    lista_para_arquivo_aux(Lista),
    told. % fecha o arquivo

% lista_para_arquivo_aux(+Dados)
% Dados é uma lista de listas. Escreve cada lista interna como uma linha na saida padrao.
lista_para_arquivo_aux([]).
lista_para_arquivo_aux([C|R]) :-
    escreve_lista(C),
    lista_para_arquivo_aux(R).

% escreve_lista(+Lista)
% Escreve cada elemento da lista na saida padrao, separando os elementos com espacos e mudando
% de linha no final.
escreve_lista([]) :-
    nl.
escreve_lista([C|R]) :-
    write(C),
    writef(" "),
    escreve_lista(R).
