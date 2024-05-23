A = [1 2 1/3;
     1/2 1 1/6;
     3 6 1];

[V, D] = eig(A); 
max_eig_val = max(diag(D)); 
index_max_eig_val = find(diag(D) == max_eig_val);
w = V(:, index_max_eig_val) / sum(V(:, index_max_eig_val)); 

lambda_max = sum((A * w) ./ w) / length(w);

n = size(A, 1);
CI = (lambda_max - n) / (n - 1);

RI = [0, 0, 0.58, 0.9, 1.12, 1.24, 1.32, 1.41, 1.45]; 
CR = CI / RI(n);

CR = round(CR, 3);

disp(['一致性比CR: ', num2str(CR)]);
