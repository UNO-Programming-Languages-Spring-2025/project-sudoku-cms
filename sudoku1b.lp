% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

% Sudoku Solver

% Put the initial numbers into the sudoku grid
sudoku(X, Y, N) :- initial(X ,Y, N).

row(1..4).
col(1..4).
val(1..4).

%  Every row and column must contain one value
1 { sudoku(R,C,V) : val(V) } 1 :- row(R), col(C).

% Each row has each value exactly once
1 { sudoku(R,C,V) : col(C) } 1 :- row(R), val(V).

% Each column has each value exactly once
1 { sudoku(R,C,V) : row(R) } 1 :- col(C), val(V).

% For a 4x4 board (2 x 2 subgrids)
subgrid(R,C,1) :- row(R), col(C), R <= 2, C <= 2.
subgrid(R,C,2) :- row(R), col(C), R <= 2, C > 2.
subgrid(R,C,3) :- row(R), col(C), R > 2, C <= 2.
subgrid(R,C,4) :- row(R), col(C), R > 2, C > 2.

% Show directives
#show sudoku/3.
#show subgrid/3.