function  a  = determinanta( A )
%   Function to calculate determinant of matrix
%   Calclate determinant via recursion (Far from optimal solution)
    [~, col] = size(A);
    a = 0;
    if col>1
        for i = 1:col
            a = a + (-1)^(1+i)*A(1,i)*determinanta(A(2:end,[1:i-1 i+1:end]));
        end
    else
        a = A(1,1);
    end
end

