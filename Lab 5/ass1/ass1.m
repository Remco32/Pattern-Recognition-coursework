%Assignment 1


%%
close all %Close all windows
%cd 'C:\Users\hschu\Documents\GitHub\Pattern-Recognition-coursework\Lab 5\';
%load('data_lvq_A.mat') %matA
%load('data_lvq_B.mat') %matB
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
%FIRST OF ALL, THIS IS HOW NORMALLY PEOPLE WOULD IMPLEMENT IT IN MATLAB
net = lvqnet(4,0.01,'learnlv1'); %4 neurons in the first competative layer, LR at 0.01, weight learning function set to LVQ1
P = vertcat(matA,matB);
T = [zeros(length(matA),1),ones(length(matA),1);ones(length(matB),1),zeros(length(matB),1)];
net = configure(net,P',T');
%net.LW{2,1}
net.trainParam.epochs = 50;
net = train(net,P',T');
%%




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
in = horzcat(matA',matB'); %input matrix
weightMatrix = rand(numberOfClasses,2); %2 features; random intialization of wMatrix.
out = compet(dist(weightMatrix,in)) %outputmatrix
gA = [-1;-1;1;1]; %gradients
LP.lr = 0.01; %learning rate as part of struct 'learning parameters'
%TrainError=[]

%while sum(TrainError(end-50:end)) > 0.5 %adjust to required precision level. Start at high cutoff. Its very simple but at least you have no problems with oscillations
%  for epoch = 1:50 %alternatively, run for a fixed amount of epochs.
 [changeMatrix, newLearningState] = learnlv1(weightMatrix,in,[],[],out,[],[],[],gA,[],LP,[]);

%missclass = %number wrongly classified items
%TrainError = horzcat(TrainError,(missclass/N))
%
%end

%Calculate class conditionals for class A and B to pseudo-randomize the initiial prototypes (w^k)

