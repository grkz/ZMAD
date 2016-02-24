clf
% zmienna niezależna w pierwszym wierszu -> transpozycja
data = load('regr.dat')';

coef = zeros(6,8);
for n=2:7
    coef(n-1,8-n:8) = polyfit(data(:,1), data(:,2), n);  
end


data_polynomials(:,1) = data(:,1);
for n=2:7
	data_polynomials(:,n) = polyval(coef(n-1,8-n:8),data(:,1));
end

%data_polynomials;

% plotting:
for i=2:7
    results_for(i, 5, data, data_polynomials)
    % chi-squared:
    chi = 0;
    for element=1:length(data_polynomials)
        chi = chi + (data(element,2)-data_polynomials(element,i))^2/2^2 ; % niepewnosc
    end
    chi_norm = chi/(length(data)-i);
    fprintf('\nn = %d:\nChi^2 = %.2f\nNorm.: Chi^2=%.4f\n', i, chi, chi_norm)
    AIC(i) = chi+2*(i+1);
    BIC(i) = chi+(i+1)*log(length(data));
    fprintf('AIC = %.2f\n', AIC(i))
    fprintf('BIC = %.2f\n\n', BIC(i))
end

fprintf('AIC:\n')

for i=2:length(AIC)
    fprintf('n = %d\tP_i/P_min: %.2f\n', i, exp(-(AIC(i) - min(AIC(2:7)))/2))
end

fprintf('\nBIC:\n')

for i=2:length(BIC)
    fprintf('n = %d\tP_i/P_min: %.4f\n', i, exp(-(BIC(i) - min(BIC(2:7)))/2))
end


%for i=1:length(data)
%    for j=1:length(data)
%        new_data(j,1) =
%


for n=2:7
    subplot(6,1,n-1)
    plot(data(:,1),data(:,2),'.')
    title(strcat('N = ', num2str(n)))
    hold on
    plot(data_polynomials(:,1),data_polynomials(:,n),'.')
    hold off
end
