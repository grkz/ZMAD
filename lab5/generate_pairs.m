function y = generate_pairs(n)
for i=[1:n]
    y(i,1) = normrnd(0,3);
    y(i,2) = normrnd(0,2);
end