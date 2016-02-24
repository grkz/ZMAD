for n=[1:10000]
    corr_tab(n) = corr(5);
end

% wyzej - generacja wsp. korelacji x 10 000

for n=[1:10000]
    t_tab(n) = corr_tab(n)*sqrt((5-2)/(1-corr_tab(n)^2));
end

[counts, centers] = hist(t_tab,-10:0.4:10);
dx = diff(centers(1:2));

bar(centers, counts/sum(counts*dx), 'r')
title('Histogram wsp. korelacji - rozkład normalny')
hold on
T = tpdf(centers, 3);
plot(centers, T, 'k-')
hold off


% f(x) = ... F(x) calka od -3 do x z f(y)dy = u (z jednor.) -> x = 3pierw.
% 3 stop. (2u-1)

fprintf('ROZKŁAD NORMALNY\n')

for i=[5:15]
    for n=[1:10000]
        corr_t(n) = corr(i);
    end
    
    critical_values(i-4,:) = [quantile(corr_t, 0.025), quantile(corr_t, 0.975)];
    fprintf('W. krytyczne (10000 próbek, n=%d): \t%.2f\t%.2f\n', i, critical_values(i-4,1), critical_values(i-4,2))
end


figure
plot(critical_values(:,1), '.')
title('Wartości krytyczne dla rozkładu normalnego - Zadanie 1')
hold on
plot(critical_values(:,2), '.')
hold off


fprintf('ROZKŁAD  1/18x^2 [-3,3], 3/16y^2 [-2,2]')

for n=[1:10000]
    corr_tab(n) = corr2(5);
end

% wyzej - generacja wsp. korelacji x 10 000

for n=[1:10000]
    t_tab(n) = corr_tab(n)*sqrt((5-2)/(1-corr_tab(n)^2));
end

[counts, centers] = hist(t_tab,-10:0.4:10);
dx = diff(centers(1:2));

figure
bar(centers, counts/sum(counts*dx), 'r')
title('Histogram wsp. korelacji - rozkład 1/18x^2 [-3,3], 3/16y^2 [-2,2]\n')
hold on
T = tpdf(centers, 3);
plot(centers, T, 'k-')
hold off


% f(x) = ... F(x) calka od -3 do x z f(y)dy = u (z jednor.) -> x = 3pierw.
% 3 stop. (2u-1)


for i=[5:15]
    for n=[1:10000]
        corr_t(n) = corr(i);
    end
    
    critical_values(i-4,:) = [quantile(corr_t, 0.025), quantile(corr_t, 0.975)];
    fprintf('W. krytyczne (10000 próbek, n=%d): \t%.2f\t%.2f\n', i, critical_values(i-4,1), critical_values(i-4,2))
end


figure
plot(critical_values(:,1), '.')
title('Wartości krytyczne dla rozkładu 1/18x^2 [-3,3], 3/16y^2 [-2,2] - Zadanie 2')
hold on
plot(critical_values(:,2), '.')
hold off