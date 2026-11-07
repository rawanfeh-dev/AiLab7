% Declare basket/1 as dynamic so we can modify it at runtime
:- dynamic basket/1.

% Initial basket with 5 items
basket([coffee, milk, chocolate, apple, juice]).

% Main menu predicate
menu :-
    nl, write('SHOPPING LIST'), nl,
    write('d. display all items.'), nl,
    write('a. Add an item to the list.'), nl,
    write('e. exit.'), nl,
    write('ENTER YOUR CHOICE: '),
    read(Choice),
    handle_choice(Choice).

% Choice 'd' (Display items using recursion)
handle_choice(d) :-
    basket(Items),
    display_list(Items),
    menu.

%Choice 'a' (Add an item to the list)
handle_choice(a) :-
    nl, write('enter the item you want to add it (with a dot at the end): '),
    read(NewItem),
    basket(OldList),
    retract(basket(OldList)),
    append(OldList, [NewItem], UpdatedList),
    assert(basket(UpdatedList)),
    write('The item has been added'), nl,
    menu.

%Choice 'e' (Exit)
handle_choice(e) :-
    nl, write('===< End >==='), nl.

% Catch-all for wrong choices
handle_choice(_) :-
    nl, write('Wrong choice, try again...'), nl,
    menu.

% Helper predicate to display list elements one by one recursively
display_list([]).
display_list([Head | Tail]) :-
    write(Head), nl,
    display_list(Tail).
