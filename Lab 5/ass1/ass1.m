%Assignment 1

%%
close all %Close all windows

load('..\data_lvq_A.mat') %matA
load('..\data_lvq_B.mat') %matB

%%
%Scatterplot
scatter(matA(:,1),matA(:,2))
hold on
scatter(matB(:,1),matB(:,2))
%Labels
title('Plot of classes A and B')
xlabel('x')
ylabel('y')
legend('Class A','Class B')

%%
%LVQ1 training

%Q3:
%Implement the LVQ1 algorithm with eta equals 0.01.
%Use the squared Euclidean norm to determine the winner.
%Include below the code of the main epoch loop of the algorithm.

%hint: After each epoch, determine the number of misclassified training examples.
%The training error E is defined as the number of misclassified training examples divided by the total number of data points presented in the epoch.
%Stop training when E becomes approximately constant.



%Set up parameters

numberOfClasses = 4;
%See https://www.mathworks.com/help/deeplearning/ref/learnlv1.html
%See https://books.google.nl/books?id=WWXMBbVqWmgC&pg=PA115&lpg=PA115&dq=matlab+learnlv1+example&source=bl&ots=SmckC0t6B6&sig=wDWWUy-mXGvL_T-KfH4x2XET65k&hl=nl&sa=X&ved=2ahUKEwiX4rT3lNzfAhUQaFAKHfb6A1sQ6AEwBXoECAEQAQ#v=onepage&q=matlab%20learnlv1%20example&f=false
inputVectors = [matA;matB]; 
weightMatrix = rand(numberOfClasses, 2); %2 features; random intialization of wMatrix.
outputVectors = 
outputGradientToPerformance = 
learningRate = 0.01;

[changeMatrix, newLearningState] = learnlv1(weightMatrix,inputVectors,[],[],outputVectors,[],[],[],outputGradientToPerformance,[],learningRate,[]);


%Calculate class conditionals for class A and B to pseudo-randomize the initiial prototypes (w^k)

