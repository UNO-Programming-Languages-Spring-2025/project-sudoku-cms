% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

row(1..4).
col(1..4).
val(1..4).

{sudoku(R,C,V) : val(V)} 1 :- row(R), col(C).
:- val(V), row(R), col(C1), col(C2), C1 != C2, sudoku(R,C1,V), sudoku(R,C2,V).
al(V), col(C), row(R1), row(R2), R1 != R2, sudoku(R1,C,V), sudoku(R2,C,V).

#show sudoku/3.
