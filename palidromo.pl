palindromo( [ ] ).
palindromo( [_] ).
palindromo([F|R] ) :- append(S,[F],R),
palindromo(S).
