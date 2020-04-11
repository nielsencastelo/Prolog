reinou(rhodi, 844, 878).
reinou(anarawd, 878, 916).
reinou(hywel_dda, 916, 950).
reinou(lago_ap_idwal, 950, 979).
reinou(hywal_ap_ieuaf, 979, 985).
reinou(cadwallon, 985, 986).
reinou(maredudd, 986, 999).

principe(X, Y) :-
reinou(X, A, B),
	Y >= A,
	Y =< B.
