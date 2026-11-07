% Case 0: deleting from an empty list gives an empty list
deleteElement(_, [], []).

% Case 1: If the head matches the element to delete, skip it and process the tail
deleteElement(X, [X | Tail], Result) :-
    deleteElement(X, Tail, Result).

% Case 2: If the head does NOT match, keep the head and process the tail
deleteElement(X, [Head | Tail], [Head | Result]) :-
    X \== Head,
    deleteElement(X, Tail, Result).
