% Main function for HW5 Problem 4
n = 5; % Number of variables in the Markov chain
psiis = cell(n-1, 1); % Initialize cell array for clique potentials

% Generate random 2x2 potentials for each pair
for i = 1:(n-1)
    psiis{i} = rand(2, 2); % Random 2x2 matrix for potential
end

% Compute marginals using the Junction Tree Algorithm
[marginals] = computeJunctionTree(psiis);

% Display the computed marginals
disp('Computed Pairwise Marginals:');
disp(marginals);

% Example test case
test = cell(4, 1);
test{1} = [0.1, 0.7; 0.8, 0.3];
test{2} = [0.5, 0.1; 0.1, 0.5];
test{3} = [0.1, 0.5; 0.5, 0.1];
test{4} = [0.9, 0.3; 0.1, 0.3];

% Compute marginals for the test case
[marginals_tests] = computeJunctionTree(test);

% Display test case marginals
disp('Test Case Pairwise Marginals:');
disp(marginals_tests);
