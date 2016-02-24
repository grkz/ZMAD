function y = numbers_fdist(n)
    for i=1:n
        y(i) = rnd();
    end
end

function y = rnd()
    % c >= 37/57*3 because f(x) = 37/57*cos(x)^2*3*g(x); c>=1.947 => c = 2
    x_try = exprnd(3);
    u = rand();
    if f(x_try) < 2*u*g(x_try)
        y = rnd();
    else
        y = x_try;
    end
end