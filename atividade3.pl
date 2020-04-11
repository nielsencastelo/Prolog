enfermo_de(manuel,gripe).
tem_sintoma(alicia,cansaco).
sintoma_de(febre,gripe).
sintoma_de(tossir,gripe).
sintoma_de(cansaco,anemia).
elimina(vitaminas,cansaco).
elimina(aspirina,febre).
elimina(xarope,tossir).
tem_sintoma(X,Y,Z):- write('(Sintoma,doença,remédio)'),sintoma_de(X,Y),elimina(Z,X).
enfermo_de(X,Y):- elimina(X,Y).
/* Consultas:
tem_sintoma(sintoma,doença,remédio).
enfermo_de(remédio,doença).
*/


