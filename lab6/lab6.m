clear all
clf
data = importdata('obserwacje.dat');

mu = 3;
sigma = 0.3;

% P(S | {x_i}) = P({x_i}|S)*P(S) dxdx/ P({x_i})dxdx

S=[0:0.001:1];
integral = 0.0;


for n=[1:length(S)] 
    P_S(n) = 1;  % P(S|{x_i})
    for i=[1:length(data)]
         P_S(n) = P_S(n) * (S(n) * normpdf(data(i), mu, sigma) + (1-S(n))/18);
    end
    P_S(n) = P_S(n) * 1;   % 1 - P(S)
    integral = integral + P_S(n)*(S(2)-S(1));
end
 
P_S = P_S./ integral;
plot(S, P_S)
title('Dla S z rozkładu jednorodnego')

% wartość oczekiwana
E_S = 0.0;
for n=[1:length(S)]
    E_S = E_S + P_S(n)*S(n)*(S(2)-S(1));
end

% odch. std
std = 0.0;
for n=[1:length(S)]
    std = std + (S(n)-E_S)^2*P_S(n)*(S(2)-S(1));
end
std = sqrt(std);
fprintf('S z rozkł. jednorodnego:\nWartosc oczekiwana S: %.2f, odch. std.: %0.4f\n', E_S, std) 



% S Z ROZKŁADU NORMALNEGO:

integral = 0.0;


for n=[1:length(S)] 
    P_S(n) = 1;  % P(S|{x_i})
    for i=[1:length(data)]
         P_S(n) = P_S(n) * (S(n) * normpdf(data(i), mu, sigma) + (1-S(n))/18);
    end
    P_S(n) = P_S(n) * normpdf(S(n), 0.3, 0.05);   % P(S)
    integral = integral + P_S(n)*(S(2)-S(1));
end
 
P_S = P_S./ integral;
figure
plot(S, P_S)
title('Dla S z rozkładu normalnego')

% wartość oczekiwana
E_S = 0.0;
for n=[1:length(S)]
    E_S = E_S + P_S(n)*S(n)*(S(2)-S(1));
end

% odch. std
std = 0.0;
for n=[1:length(S)]
    std = std + (S(n)-E_S)^2*P_S(n)*(S(2)-S(1));
end
std = sqrt(std);
fprintf('S z rozkł. normalnego:\nWartosc oczekiwana S: %.2f, odch. std.: %0.4f\n', E_S, std)



% Rozkład dwuwymiarowy
clear all;
data = importdata('obserwacje.dat');
S = 0.2;
mu = [2:0.01:4];
sigma = [0.1:0.01:0.5];
integral = 0.0;
for n=[1:length(mu)]
    for m=[1:length(sigma)] 
        P_S(n,m) = 1;  % P(S|{x_i})
        for i=[1:length(data)]
            P_S(n,m) = P_S(n,m) * (S * normpdf(data(i), mu(n), sigma(m)) + (1-S)/18);
        end
        P_S(n,m) = P_S(n,m) * 2.5 * 0.5 ;   % P(sigma)P(mu)
        integral = integral + P_S(n,m)*((mu(2)-mu(1))*(sigma(2)-sigma(1)));    % dmu, dsigma
    end
end

P_S = P_S./ integral;

figure
surf(sigma, mu, P_S)


% wartość oczekiwana sigma
E_mu = 0.0;
std_mu = 0.0;
E_sigma = 0.0;
std_sigma = 0.0;
for n=[1:length(mu)]
    for m=[1:length(sigma)]
        E_mu = E_mu + P_S(n,m)*mu(n)*((mu(2)-mu(1))*(sigma(2)-sigma(1)));
        E_sigma = E_sigma + P_S(n,m)*sigma(m)*((mu(2)-mu(1))*(sigma(2)-sigma(1)));
    end
end

for n=[1:length(mu)]
    for m=[1:length(sigma)]
        std_mu = std_mu + P_S(n,m)*(mu(n) - E_mu)^2*((mu(2)-mu(1))*(sigma(2)-sigma(1)));
        std_sigma = std_sigma + P_S(n,m)*(sigma(m) - E_sigma)^2*((mu(2)-mu(1))*(sigma(2)-sigma(1)));
    end
end
fprintf('Rozkład dwuwymiarowy:\n')
fprintf('Wartosc oczekiwana mu: %.3f, odch. std. mu: %.3f\n', E_mu, sqrt(std_mu));
fprintf('Wartosc oczekiwana sigma: %.3f, odch. std. sigma: %.3f\n', E_sigma, sqrt(std_sigma));













