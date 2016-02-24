function y = corr2(n)
a = generate_pairs2(n);
y = corrcoef(a);
y = y(2,1);
end