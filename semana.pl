semana(segunda).
semana(terca).
semana(quarta).
semana(quinta).
semana(sexta).
fimdesemana(sabado).
fimdesemana(domingo).

categoria(X) :- fimdesemana(X), writef('%w%w', [X, ' é um final de semana']), !.
categoria(X) :- semana(X), writef('%w%w', [X, ' é um dia de semana.']).




