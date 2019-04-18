function [components variances] = pca(X, m)
  close all
  meanX = mean(X);
  for i = 1:size(X,1)
      for j = 1:size(X,2)
          X(i,j) = X(i,j) - meanX(j);
      end
  end

  % Transpose X to calc C    
  X_T = transpose(X);
  % Use the formula gives to calulate C
  cov = (1/(size(X,1) - 1)) * X_T * X;
%------------------------------------------------------------------------------------------------------------------------------------
  [V, D] = eigs(cov, m);
 
  % eigenvectors = V = princ. components
  components = V;


  variances = diag(D);
end 
