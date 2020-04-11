% pot(Base,Expoente,Potência)
  pot(_,0,1).     % base
  pot(B,N,P) :-   % passo
      N>0,          % condição do passo
      M is N-1,     % simplifica o problema
      pot(B,M,R),   % obtém solução da instância menor
      P is B*R.     % constrói solução final
