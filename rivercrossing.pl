
try(X) :- functioncall([3/2/1/0/0/0/left],X).
functioncall([0/0/0/3/2/1/X|T],[0/0/0/3/2/1/X|T]).

%recursive calling for search for new move
functioncall([Lhuman/Lsmallmonkey/Lbigmonkey/Rhuman/Rsmallmonkey/Rbigmonkey/S|T],Result) :-
	on_boat(Lhuman/Lsmallmonkey/Lbigmonkey/Rhuman/Rsmallmonkey/Rbigmonkey/S,Lhuman2/Lsmallmonkey2/Lbigmonkey2/Rhuman2/Rsmallmonkey2/Rbigmonkey2/S2),
    does_exist(Lhuman/Lsmallmonkey/Lbigmonkey/Rhuman/Rsmallmonkey/Rbigmonkey),
    not(member(Lhuman2/Lsmallmonkey2/Lbigmonkey2/Rhuman2/Rsmallmonkey2/Rbigmonkey2/S2,T)),
    add(Lhuman/Lsmallmonkey/Lbigmonkey/Rhuman/Rsmallmonkey/Rbigmonkey/S,T,L1),
    add(Lhuman2/Lsmallmonkey2/Lbigmonkey2/Rhuman2/Rsmallmonkey2/Rbigmonkey2/S2,L1,L2),
    functioncall(L2, Result).

%whether the move is valid or not
does_exist(Lhuman/Lsmallmonkey/Lbigmonkey/Rhuman/Rsmallmonkey/Rbigmonkey) :-
	( Lbigmonkey+Lsmallmonkey =< Lhuman ; Lhuman = 0 ), ( Rsmallmonkey+Rbigmonkey =< Rhuman ;Rhuman = 0),
	Lhuman > -1, Rhuman > -1, Lbigmonkey > -1, Lsmallmonkey > -1,Rsmallmonkey > -1, Lbigmonkey > -1,
	Lhuman < 4, Rhuman < 4, Lbigmonkey < 2, Lsmallmonkey < 3,Rsmallmonkey < 3, Rbigmonkey < 2.

%two humans travelling left to right
on_boat(Lhuman/Lsmallmonkey/Lbigmonkey/Rhuman/Rsmallmonkey/Rbigmonkey/left, Lhuman2/Lsmallmonkey/Lbigmonkey/Rhuman2/Rsmallmonkey/Rbigmonkey/right) :-
    Lhuman2 is Lhuman - 2, Rhuman2 is Rhuman + 2.

%two humans travelling right to left
on_boat(Lhuman/Lsmallmonkey/Lbigmonkey/Rhuman/Rsmallmonkey/Rbigmonkey/right, Lhuman2/Lsmallmonkey/Lbigmonkey/Rhuman2/Rsmallmonkey/Rbigmonkey/left) :-
    Lhuman2 is Lhuman + 2, Rhuman2 is Rhuman - 2.

%one big money and small monkey travelling from left to right
on_boat(Lhuman/Lsmallmonkey/Lbigmonkey/Rhuman/Rsmallmonkey/Rbigmonkey/left, Lhuman/Lsmallmonkey2/Lbigmonkey2/Rhuman/Rsmallmonkey2/Rbigmonkey2/right) :-
    Lsmallmonkey2 is Lsmallmonkey - 1, Rsmallmonkey2 is Rsmallmonkey + 1,Lbigmonkey2 is Lbigmonkey - 1, Rbigmonkey2 is Rbigmonkey + 1.

%one big and small monkey travelling from right to left
on_boat(Lhuman/Lsmallmonkey/Lbigmonkey/Rhuman/Rsmallmonkey/Rbigmonkey/right, Lhuman/Lsmallmonkey2/Lbigmonkey2/Rhuman/Rsmallmonkey2/Rbigmonkey2/left) :-
    Lsmallmonkey2 is Lsmallmonkey + 1, Rsmallmonkey2 is Rsmallmonkey - 1,Lbigmonkey2 is Lbigmonkey + 1, Rbigmonkey2 is Rbigmonkey - 1.

%one big monkey and human travelling from left tor right
on_boat(Lhuman/Lsmallmonkey/Lbigmonkey/Rhuman/Rsmallmonkey/Rbigmonkey/left, Lhuman2/Lsmallmonkey/Lbigmonkey2/Rhuman2/Rsmallmonkey/Rbigmonkey2/right) :-
    Lbigmonkey2 is Lbigmonkey - 1, Rbigmonkey2 is Rbigmonkey + 1,Lhuman2 is Lhuman - 1, Rhuman2 is Rhuman + 1.

%one big monkey and human travelling from right to left
on_boat(Lhuman/Lsmallmonkey/Lbigmonkey/Rhuman/Rsmallmonkey/Rbigmonkey/right, Lhuman2/Lsmallmonkey/Lbigmonkey2/Rhuman2/Rsmallmonkey/Rbigmonkey2/left) :-
    Lbigmonkey2 is Lbigmonkey + 1, Rbigmonkey2 is Rbigmonkey - 1,Lhuman2 is Lhuman + 1, Rhuman2 is Rhuman - 1.

%one small monkey and human travelling from left tor right
on_boat(Lhuman/Lsmallmonkey/Lbigmonkey/Rhuman/Rsmallmonkey/Rbigmonkey/left, Lhuman2/Lsmallmonkey2/Lbigmonkey/Rhuman2/Rsmallmonkey2/Rbigmonkey/right) :-
    Lsmallmonkey2 is Lsmallmonkey - 1, Rsmallmonkey2 is Rsmallmonkey + 1,Lhuman2 is Lhuman - 1, Rhuman2 is Rhuman + 1.

%one small monkey and human travelling from right to left
on_boat(Lhuman/Lsmallmonkey/Lbigmonkey/Rhuman/Rsmallmonkey/Rbigmonkey/right, Lhuman2/Lsmallmonkey2/Lbigmonkey/Rhuman2/Rsmallmonkey2/Rbigmonkey/left) :-
    Lsmallmonkey2 is Lsmallmonkey + 1, Rsmallmonkey2 is Rsmallmonkey - 1,Lhuman2 is Lhuman + 1, Rhuman2 is Rhuman - 1.

%one human can from left to right
on_boat(Lhuman/Lsmallmonkey/Lbigmonkey/Rhuman/Rsmallmonkey/Rbigmonkey/left, Lhuman2/Lsmallmonkey/Lbigmonkey/Rhuman2/Rsmallmonkey/Rbigmonkey/right) :-
    Lhuman2 is Lhuman - 1, Rhuman2 is Rhuman + 1.

%one human travelling from right to left
on_boat(Lhuman/Lsmallmonkey/Lbigmonkey/Rhuman/Rsmallmonkey/Rbigmonkey/right, Lhuman2/Lsmallmonkey/Lbigmonkey/Rhuman2/Rsmallmonkey/Rbigmonkey/left) :-
    Lhuman2 is Lhuman + 1, Rhuman2 is Rhuman - 1.

%one big monkey travelling from left to right
on_boat(Lhuman/Lsmallmonkey/Lbigmonkey/Rhuman/Rsmallmonkey/Rbigmonkey/left, Lhuman/Lsmallmonkey/Lbigmonkey2/Rhuman/Rsmallmonkey/Rbigmonkey2/right) :-
    Lbigmonkey2 is Lbigmonkey - 1, Rbigmonkey2 is Rbigmonkey + 1.

%ne big monkey travelling from right to left
on_boat(Lhuman/Lsmallmonkey/Lbigmonkey/Rhuman/Rsmallmonkey/Rbigmonkey/right, Lhuman/Lsmallmonkey/Lbigmonkey2/Rhuman/Rsmallmonkey/Rbigmonkey2/left) :-
    Lbigmonkey2 is Lbigmonkey + 1, Rbigmonkey2 is Rbigmonkey - 1.

add(X,L,[X|L]).

