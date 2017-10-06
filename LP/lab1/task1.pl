% Реализация стандартных предикатов обработки списков

% Длина списка
% (список, длина)
my_length([], 0).
my_length([_|L], N):-my_length(L, M), N is M + 1.

% Принадлежность элемента списку
% (элемент, список)
my_member(X, [X|_]).
my_member(X, [_|T]):-my_member(X, T).

% Конкатeнация списков
% (список1, список2, список1+2)
my_append([], L, L).
my_append([X|L1], L2, [X|L3]):-my_append(L1, L2, L3).

% Удаление элемента из списка
% (элемент, список, список без элемента)
my_remove(X, [X|T], T).
my_remove(X, [Y|T], [Y|Z]):-my_remove(X, T, Z).

% Перестановки элементов в списке
% (список, перестановка)
my_permute([], []).
my_permute(L, [X|T]):-my_remove(X, L, Y), my_permute(Y, T).

% Подсписки списка
% (подсписок, список)
my_sublist(S, L):-my_append(_, L1, L), my_append(S, _, L1).

% Добавление элемента в конец списка
% (элемент, список, список с новым элементом)
add_last_std(X, L1, L2):-append(L1, [X], L2).

% Добавление элемента в конец списка (без стандартных предикатов)
% (элемент, список, список с новым элементом)
add_last(X, [], [X]).
add_last(X, [H|T], [H|R]):-add_last(X, T, R).

% Проверка списка на арифметическую прогрессию (без стандартных предикатов)
% (список)
is_arithm([X,Y,Z|T]):-
    !,
    X - Y =:= Y - Z,
    is_arithm([Y,Z|T]).
is_arithm(_).

% Пример совместного использования предикатов
% Вставка нового элемента в конец списка и проверка списка на арифметическую прогрессию
% (элемент, список)
is_new_arithm(X, L1):-add_last(X, L1, L2), is_arithm(L2).
