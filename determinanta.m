function  a  = determinanta( matrix, matrixColumn )
%   Function to calculate determinant of matrix
%   Calclate determinant via recursion (Far from optimal solution)
    a = 0;
    if matrixColumn>1
        for i = 1:matrixColumn
            a = a + (-1)^(1+i)*matrix(1,i)*determinanta(matrix(2:end,[1:i-1 i+1:end]), matrixColumn - 1);
        end
    else
        a = matrix(1,1);
    end
end

