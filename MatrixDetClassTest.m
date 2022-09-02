classdef MatrixDetClassTest < matlab.unittest.TestCase
    %MatrixDetClassTest is test class function to test matrixDet function
    %   
    properties (TestParameter) %% parameters that will be used in test methods
        squareMatrixes = struct('matrix1',[1 2; -1 -2],'matrix2',[1 2 5; pi -2 10; 1 5 9],'matrix3',[1 10 5; -1 -2 2;-6 11 6;]);
        squareMatrixDeterminant = struct('matrixDeterminant1', 0,'matrixDeterminant2',-16.008851424871455,'matrixDeterminant3', -209);
        nonSquareMatrixes = struct('nonSquareMatrixes1',[1 2;],'nonSquareMatrixes2',[1 2; pi 10; 5 9],'nonSquareMatrixes3',[1 10 5; -1 -2 2;]);
        emptyMatrix = struct('emptyMatrix',[]); 
        vectorRows = struct('vectorRow1',[1 2 -1 -2],'vectorRow2',[1 2 5 -1 -2 10],'vectorRow3',[1 10 2 5 -1 -2 10 2]);
        vectorColumns = struct('vectorColumn1',[1 2 -1 -2]','vectorColumn2',[1 2 5 -1 -2 10]','vectorColumn3',[1 10 2 5 -1 -2 10 2]');
        scalars = struct('scalar1',1,'scalar2',3,'scalar3',4,'scalar4',6,'scalar5',7);
        scalarDeterminant = struct('scalarDeterminant1',1,'scalarDeterminant2',3,'scalarDeterminant3',4,'scalarDeterminant4',6,'scalarDeterminant5',7)
        cells = {{1},{3},{[55, 22; 3 3]},{[55, 22, 3, 3]}};
        squareMatrixOfCells ={[{1} {2}; {-1} {-2}],[{1} {2} {-2}; {-1} {-2},{-4}]};
        squareMatrixWithString =struct('stringMatrix1',[1, 2; '3', 4],'stringMatrix2',['1', '2'; '3', '4']);
        squareMatrixWithComplexNumbers = struct('matixWithComplexNumbers1', [3+2i,1+5i;-3+2i, 3-2i],'matixWithComplexNumbers2', [2i,1+5i;-3+2i, 3]);
        squareMatrixWithComplexNumberDeterminants = struct('squareMatrixWithComplexNumberDeterminants1',26+13i,'squareMatrixWithComplexNumberDeterminants2',13+19i);    
        squareMultidimensionalArray = struct('multidimensionalArray1', ones(4,4,5),'multidimensionalArray2', zeros(2,2,6));
    end
    properties
       calculationError  
    end
    methods(TestClassSetup) %% runs when test class is about to close
        function setupOnce(testCase)
            format long
            testCase.calculationError = 10^(-12);
        end
    end
    methods(TestClassTeardown) %% runs when test class is about to close
        function teardownOnce(testCase)
            format short
        end
    end
    methods (Test, ParameterCombination = 'sequential')
        function testMatrixDeterminant1(testCase, squareMatrixes,squareMatrixDeterminant)
            actualSolution = matrixDet(squareMatrixes);
            expectedSolution = squareMatrixDeterminant;
            verifyLessThan(testCase,abs(actualSolution-expectedSolution), testCase.calculationError, 'Determinant is wrong')
        end
        function testScalarDeterminant(testCase, scalars, scalarDeterminant)
            actualSolution = matrixDet(scalars);
            expectedSolution = scalarDeterminant;
             verifyLessThan(testCase,abs(actualSolution-expectedSolution), testCase.calculationError, 'Determinant is wrong')
        end
        function testSquareMatrixWithComplexNumberDeterminant(testCase, squareMatrixWithComplexNumbers, squareMatrixWithComplexNumberDeterminants)
            actualSolution = matrixDet(squareMatrixWithComplexNumbers);
            expectedSolution = squareMatrixWithComplexNumberDeterminants;
             verifyLessThan(testCase,abs(actualSolution-expectedSolution), testCase.calculationError, 'Determinant is wrong')
        end
    end
    methods (Test)
        function testMatrixDeterminant2(testCase, squareMatrixes)
            actualSolution = matrixDet(squareMatrixes);
            expectedSolution = det(squareMatrixes);
            verifyLessThan(testCase,abs(actualSolution-expectedSolution), testCase.calculationError, 'Maximum is wrong')
        end
        function testNonSquareMatrix(testCase, nonSquareMatrixes)
             verifyError(testCase,@() matrixDet(nonSquareMatrixes),?MException, 'Can''t calculate determinant of vector row')
        end
        function testDeterminantInVectorRow(testCase, vectorRows)
             verifyError(testCase,@() matrixDet(vectorRows),?MException, 'Can''t calculate determinant of vector row')
        end
        function testDeterminantInVectorColumns(testCase, vectorColumns)
             verifyError(testCase,@() matrixDet(vectorColumns),?MException, 'Can''t calculate determinant of vector column')
        end
        function testEmprtyMatrix(testCase,emptyMatrix)
            verifyError(testCase,@() matrixDet(emptyMatrix),?MException,'Can''t calculate determinant empty matrix')
        end
        function testMatrixDetWithoutInputArgument(testCase)
            verifyError(testCase,@() matrixDet(),?MException,'Can''t calculate determinant if there isn''t any input variable')
        end 
        function testCells(testCase,cells)
            verifyError(testCase,@() matrixDet(cells),?MException,'Can''t calculate determinant of cell')
        end
        function testSquareMatrixWithCells(testCase,squareMatrixOfCells)
            verifyError(testCase,@() matrixDet(squareMatrixOfCells),?MException,'Can''t calculate determinant of cell')
        end       
        function testSquareMatrixWithString(testCase,squareMatrixWithString)
            verifyError(testCase,@() matrixDet(squareMatrixWithString),?MException,'Can''t calculate determinant when at least one element is string or char')
        end
        function testSquareMultidimensionalArray(testCase,squareMultidimensionalArray)
            verifyError(testCase,@() maximumValue(squareMultidimensionalArray),?MException,'Can''t calculate determinant of multidimensional array')
        end
    end
    
end

