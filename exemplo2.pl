gosta(maria, chocolate).
gosta(maria, vinho).
gosta(pedro, vinho).
gosta(julia,vinho).
gosta(pedro, chocolate).
gosta(pedro, X) :- gosta(X, vinho), gosta(X, chocolate).
