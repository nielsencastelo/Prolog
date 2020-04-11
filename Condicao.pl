if(Condition,Then,Else) :- Condition, !, Then.
if(_,_,Else) :- Else.
%?- if(8 mod 2 =:= 0, write(par), write(ímpar)).
