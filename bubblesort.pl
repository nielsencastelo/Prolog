bubblesort( Lista_In,Lista_Out ) :-
append( L_Front , [A, B| Rest ] , Lista_In ) , % Lista_In = [A + B| Rest ]
B < A,!,                                       % checa se B � menor que A
append( L_Front , [B, A| Rest ] , L_Rest ) ,   % L_Rest = [B + A| Rest ]
bubblesort( L_Rest , Lista_Out ).              % utiliza e regra recursivamente
bubblesort( Lista , Lista ).	       % L i s t a j� e s t � ordenada
