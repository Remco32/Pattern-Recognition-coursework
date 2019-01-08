%assignment 2

%Using a dummy data set until we can implement the results from ass1

%%
%Create dummy data
load('..\data_lvq_A.mat') %matA
load('..\data_lvq_B.mat') %matB
dataSet = vertcat(matA,matB);

%%
%Split dataset into 10 folds.

%loop k times, creating k splits of the dataset
k = 10;
for i = 1:k  
    %Decide a point in the set to split:
    sizeOfTestSet = 20;
    splitLocation = randi([1+sizeOfTestSet length(dataSet)-sizeOfTestSet]);
    
    %sizes should be approximately the same, so let's take 5% below and
    %over the point of the split
    lowerBound = splitLocation - (0.05 * length(dataSet)); 
    upperBound = splitLocation + (0.05 * length(dataSet)) - 1; %account for off-by-one error
    
    %Seperate the data
    testSet = dataSet(lowerBound:upperBound, :);
    trainingSet = setdiff(dataSet, testSet, 'rows');
    
    %%Train on the biggest remaining set

    %%Validate on the smaller set
end



