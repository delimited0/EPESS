function [ empirical_KL ] = empiricalKLDivergence( MCMC_samples, mixture_means, mixture_covariances, mixture_weights, KL_accuracy_number_samples, dimension )
%Calculates the empirical KL Divergence for the simulated mixture of
%gaussians
% Uses K=1 in KNN.

    mixture_gaussians_object = gmdistribution(mixture_means, mixture_covariances, mixture_weights');

    mixture_samples = random(mixture_gaussians_object, KL_accuracy_number_samples);
    [indices, samples_distances] = knnsearch(MCMC_samples, mixture_samples);

    % [indices, mixture_distances] = knnsearch(mixture_samples, mixture_samples, 'K',2);
    % mixture_distances = mixture_distances(:,2);
    % plot(sim_samples(:,1),sim_samples(:,2),'x')
    % hold on
    % plot(mixture_samples(:,1),mixture_samples(:,2),'o')
    % hold off
    % empirical_KL =  dimension / KL_accuracy_number_samples * sum( log(samples_distances) - log(mixture_distances) ) + log(length(sim_samples)) - log(KL_accuracy_number_samples-1);

    empirical_KL = sum(log(pdf(mixture_gaussians_object, mixture_samples))) / KL_accuracy_number_samples ...
        + log(length(MCMC_samples)) - gammaln(dimension/2+1) + (dimension/2)*log(pi) ...
        + dimension * sum( log(samples_distances) ) / KL_accuracy_number_samples...
        + double(eulergamma);

end
