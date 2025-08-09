% family_kb.pl
% A small, original family-relationship knowledge base.
% Author: (AdrianGithinjiID668211).
% Load in SWI-Prolog with: ?- consult('C:/path/to/family_kb.pl').

% -----------------------------
% Facts: parent(child, parent).
% We'll express as parent(Parent, Child).
% -----------------------------
parent(laura, nina).
parent(mark, nina).

parent(laura, paul).
parent(mark, paul).

parent(nina, rachel).
parent(paul, rachel).

parent(nina, sophia).
parent(paul, sophia).

parent(nina, oliver).
parent(paul, oliver).

parent(rachel, emma).
parent(simon, emma).

parent(rachel, daniel).
parent(simon, daniel).

parent(sophia, luke).
parent(tom, luke).

parent(sophia, mia).
parent(tom, mia).

% -----------------------------
% Facts: gender
% -----------------------------
female(laura).
female(nina).
female(rachel).
female(sophia).
female(emma).
female(mia).

male(mark).
male(paul).
male(simon).
male(tom).
male(oliver).
male(daniel).
male(luke).

% -----------------------------
% Basic relations
% -----------------------------
% sibling(X,Y) : share at least one parent and are different persons.
sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

% full_sibling(X,Y) : share both parents (useful if you store both parents)
% For this KB we don't always have explicit two-parent facts for everyone,
% but this rule is included for completeness.
full_sibling(X, Y) :-
    parent(P1, X), parent(P1, Y),
    parent(P2, X), parent(P2, Y),
    P1 \= P2,
    X \= Y.

% half_sibling(X,Y) : share exactly one parent (not both)
half_sibling(X, Y) :-
    sibling(X, Y),
    \+ full_sibling(X, Y).

% sister and brother depend on sibling + gender
sister(X, Y) :-
    sibling(X, Y),
    female(X).

brother(X, Y) :-
    sibling(X, Y),
    male(X).

% -----------------------------
% Uncle/Aunt: sibling of a parent
% -----------------------------
uncle(X, Y) :-
    parent(P, Y),
    brother(X, P).

aunt(X, Y) :-
    parent(P, Y),
    sister(X, P).

% -----------------------------
% Cousin: children of siblings (parents are siblings)
% -----------------------------
cousin(X, Y) :-
    parent(PX, X),
    parent(PY, Y),
    sibling(PX, PY),
    X \= Y.

% -----------------------------
% Grandparent, great-grandparent
% -----------------------------
grandparent(X, Y) :-
    parent(X, P),
    parent(P, Y).

greatgrandparent(X, Y) :-
    parent(X, G),
    grandparent(G, Y).

% -----------------------------
% Ancestor / Descendant (recursive)
% -----------------------------
ancestor(X, Y) :-
    parent(X, Y).
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

descendant(X, Y) :-
    ancestor(Y, X).

% -----------------------------
% Niece / Nephew: child of one's sibling
% -----------------------------
niece(X, Y) :-
    parent(P, X),
    sibling(P, Y),
    female(X).

nephew(X, Y) :-
    parent(P, X),
    sibling(P, Y),
    male(X).

% -----------------------------
% family_member: anyone who participates in parent relation
% (either appears as a parent or as a child)
% -----------------------------
family_member(X) :-
    parent(X, _).
family_member(X) :-
    parent(_, X).

% -----------------------------
% Utility rules for convenience
% All results can be collected with findall/3
% Example: ?- findall(U, uncle(U, emma), L).
% -----------------------------
