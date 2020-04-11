% fat(Número,Fatorial)
  fat(0,1).     % base
  fat(N,F) :-   % passo
      N>0,        % condição do passo
      M is N-1,   % simplifica o problema
      fat(M,R),   % obtém solução da instância menor
      F is N*R.   % constrói solução final
