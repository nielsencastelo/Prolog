sintoma(gripe,['febre','tosse','dores_no_corpo']).
sintoma(rinite_alergica,['irritacoes_no_corpo','espirros','coriza']).
sintoma(depressao,['pessimismo','desanimo','cansaco']).
sintoma(bronquite,['desconforto_no_peito','tosse','fadiga']).
sintoma(aftas,['lesoes_na_boca']).
sintoma(tetano,['espasmos_musculares','rigidez_muscular']).

remedio(gripe,xarope).
remedio(rinite_alergica,corticoides).
remedio(depressao,antidepressivo).
remedio(bronquite,inalador).
remedio(aftas,antiinflamatorio).
remedio(tetano,antibiotico).

% tratamento(D,S,R) :- sintoma(D,S), remedio(D,R).

tratamento(D,S,R) :- sintoma(D,S), remedio(D,R), writef('%w%w', ['O paciente esta com ', D]), writef('%w%w', [' e precisa de ', R]).

% Usar "tratamento" e indicar pelo menos uma das 3 variaveis (D=doenca,
% S=sintoma, R=remedio). O programa retorna as variaveis que faltam e a
% frase "O paciente esta com [doenca] e precisa de [remedio]". A
% observacao e uma simplificacao da regra.
