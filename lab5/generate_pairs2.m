function y = generate_pairs2(n)
for i=[1:n]
    u = rand();
    y(i,1) = 2*nthroot((2*u-1),3);
    u = rand();
    y(i,2) = 2*nthroot((2*u-1),3);
end