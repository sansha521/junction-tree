function [pairwise_marginals] = computeJunctionTree(potential_functions)
    

    pairwise_marginals = potential_functions; 
    num_cliques = size(pairwise_marginals, 1); 
    separator_values = ones(num_cliques-1, 2); 

    % Forward Pass (Left-to-Right)
    for k = 1:(num_cliques-1)
        separator_values(k, :) = sum(pairwise_marginals{k}, 1); 
        pairwise_marginals{k+1} = pairwise_marginals{k+1} .* (separator_values(k, :)' * [1, 1]); 
    end

    % Backward Pass (Right-to-Left)
    for k = 1:(num_cliques-1)
        previous_separator = separator_values(num_cliques-k, :); 
        separator_values(num_cliques-k, :) = sum(pairwise_marginals{num_cliques-k+1}, 2)'; 
        pairwise_marginals{num_cliques-k} = pairwise_marginals{num_cliques-k} .* ([1; 1] * (separator_values(num_cliques-k, :) ./ previous_separator)); % Update the previous clique
    end

    % Normalize Marginals
    for k = 1:num_cliques
        pairwise_marginals{k} = pairwise_marginals{k} / sum(pairwise_marginals{k}, 'all'); 
    end
end
