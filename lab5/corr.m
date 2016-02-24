function y = corr(n)
a = generate_pairs(n);
y = corrcoef(a);
y = y(2,1);
end
