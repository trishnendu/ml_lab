function W = plot_nonlreg_gen(data, n)
    x = data(:, 2);
    y = data(:, 3);
    N = length(x);
    n = n + 1;
    X = ones(n);
    Y = ones(n, 1);
    t1 = 1;
    for i = 1:n
        t2 = ones(size(x));
        for j = 1:n
             X(i,j) = sum(t1 .* t2)/N;
             t2 = t2 .* x;
        end
        t1 = t1 .* x;
    end
    t3 = y;
    for i = 1:n
        Y(i,1) = sum(t3)/N;
        t3 = t3 .* x;
    end
    W = X\Y;
    scatter(x, y, 'filled', 'r');
    hold on;
    xe = linspace(min(x), max(x), 1000);
    t = 1;
    ye = 0;
    for i = 1:n
        ye = ye + W(i)*t;
        t = t .* xe;
    end
    plot(xe, ye);
    hold off;
end
