% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

% Sudoku Solver

% Put the initial numbers into the sudoku grid
sudoku(X, Y, N) :- initial(X ,Y, N).

row(1..9).
col(1..9).
val(1..9).

%  Every row and column must contain one value
1 { sudoku(R,C,V) : val(V) } 1 :- row(R), col(C).

% Each row has each value exactly once
1 { sudoku(R,C,V) : col(C) } 1 :- row(R), val(V).

% Each column has each value exactly once
1 { sudoku(R,C,V) : row(R) } 1 :- col(C), val(V).

% For a 9x9 board (3 x 3 subgrids, 9 subgrids)
subgrid(R,C,1) :- row(R), col(C), R <= 3, C <= 3.
subgrid(R,C,2) :- row(R), col(C), R <= 3, C > 3, C <= 6.
subgrid(R,C,3) :- row(R), col(C), R <= 3, C > 6.
subgrid(R,C,4) :- row(R), col(C), R > 3, R <= 6, C <= 3.
subgrid(R,C,5) :- row(R), col(C), R > 3, R <= 6, C > 3, C <= 6.
subgrid(R,C,6) :- row(R), col(C), R > 3, R <= 6, C > 6.
subgrid(R,C,7) :- row(R), col(C), R > 6, C <= 3.
subgrid(R,C,8) :- row(R), col(C), R > 6, C <= 6, C > 3.
subgrid(R,C,9) :- row(R), col(C), R > 6, C > 6.

% No two elements within any subgrid can equal eachother
% all subgrid values should be distinct.
:- sudoku(R1,C1,V), sudoku(R2,C2,V), 
   subgrid(R1,C1,G), subgrid(R2,C2,G),
   (R1,C1) != (R2,C2).

% Show directives (for sudoku only)
#show sudoku/3.