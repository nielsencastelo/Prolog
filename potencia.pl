% pot(Base,Expoente,Pot�ncia)
  pot(_,0,1).     % base
  pot(B,N,P) :-   % passo
      N>0,          % condi��o do passo
      M is N-1,     % simplifica o problema
      pot(B,M,R),   % obt�m solu��o da inst�ncia menor
      P is B*R.     % constr�i solu��o final
