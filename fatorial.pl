% fat(N�mero,Fatorial)
  fat(0,1).     % base
  fat(N,F) :-   % passo
      N>0,        % condi��o do passo
      M is N-1,   % simplifica o problema
      fat(M,R),   % obt�m solu��o da inst�ncia menor
      F is N*R.   % constr�i solu��o final
