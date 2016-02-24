function y=results_for(n, number, data, data_polynomials)
    %fprintf('Przyklad (%d pierwszych linii) dla n = %d:\n', number, n)
    fprintf('-------------------------------------------------------------------------\n')
    fprintf('\tx\t\ty\t\tf(x)\t\terror (f(x_i)-y_i)\n')
    fprintf('-------------------------------------------------------------------------\n')
    for i=1:number
        fprintf('\t%.3f\t\t%.3f\t\t%.3f\t\t%.6f\n', data(i,1), data(i,2), data_polynomials(i,n), (data_polynomials(i,n)-data(i,2)))
    end
end