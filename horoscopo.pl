signo(aries, 21,3, 19,4).
signo(touro, 20,4, 20,5).
signo(gemeos, 21,5, 21,6).
signo(cancer, 22,6, 22,7).
signo(leão, 23,7, 22,8).
signo(virgem, 23,8, 22,9).
signo(libra, 23,9, 22,10).
signo(escorpião, 23,10,21,11).
signo(sagitario, 22,11, 21,01).
signo(capricornio, 22,12,19,1).
signo(aquario, 20,1, 18,2).
signo(peixes, 19,2, 20,3).

horoscopo(D,M,S):- signo(S, DI,MI, DF,MF), ((M = MI, D >= DI); (M = MF), D =< DF).
