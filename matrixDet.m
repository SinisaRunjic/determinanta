function determinant = matrixDet( matrix )
%matrixDet calculates matrix determinant
%   matrixDet uses Laplace expansion to determen determinant of matrix
    %% test number of input arguments
    assert(nargin>0,'Provide input argument');
    [matrixRow,matrixColumn, matrixLayer] = size(matrix);
    %% test if matix is a cell 
    assert(~iscell(matrix),'Input that you provide is a cell');
    %% test if matrix is square
    assert(matrixRow == matrixColumn,'Matrix isn''t square');
    %% test if matrix is multidimensional array
    assert(matrixLayer == 1,'Variable that you provide is multidimensional array');
    %% test if matrix has elements
    assert(matrixRow ~= 0 & matrixColumn ~= 0 ,'Matrix that you provide doesn''t have any elements');
    %% test if matrix is numeric
    assert(isnumeric(matrix),'At least one element in matrix isn''t numeric');
    determinant = determinanta(matrix, matrixColumn);
end

