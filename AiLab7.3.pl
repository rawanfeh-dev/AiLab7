% Adding an element at the end of a list using append/3
add_at_the_end(X, List, Result) :-
    append(List, [X], Result).
