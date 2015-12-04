function [ mu, Sigma, chol_Sigma, C, lB, uB ] = simulateTmg( dimension, axis_interval, distance_box_placement, inverse_wishart_df, lB, uB)


    % mean, covariances
    
       mu = zeros(dimension,1);
       lambda= 0;
       Sigma = (1-lambda) *1 * eye(dimension) + lambda* iwishrnd(eye(dimension), inverse_wishart_df);
       chol_Sigma = chol(Sigma);
       
    % Specify Box constarints
        
       C = eye(dimension);
       
end
       
   




