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
    %%Randomly (according to the slides, at least) break the dataset into k partitions
    
    %Decide a point in the set to split:
    splitLocation = randi([1 length(dataSet)]);
    
    %sizes should be approximately the same, so let's take 5% below and
    %over the point of the split
    lowerBound = splitLocation - (0.05 * length(dataSet)); 
    upperBound = splitLocation + (0.05 * length(dataSet)) - 1; %account for off-by-one error
    
    %account for bound-errors (i.e. getting point at index -9)
    %...through brute force (setting bounds to their respective limits
    %where needed)
    if lowerBound < 1
        lowerBound = 1;
        upperBound = 0.1 * length(dataSet); %times .1 since the bound is in one direction
    end
    if upperBound > length(dataSet)
        upperBound = length(dataSet);
        lowerBound = length(dataSet) - (0.1 * length(dataSet));
    end
    
    %Seperate the data
    testSet = dataSet(lowerBound:upperBound, :);
    trainingSet = setdiff(dataSet, testSet, 'rows');
    
    %%Train on the biggest remaining set

    %%Validate on the smaller set
    
end



