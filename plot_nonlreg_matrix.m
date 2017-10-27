function [W,X,Y] = plot_nonlreg_matrix(data)
    x = data(:, 2);
    y = data(:, 3);
    N = length(x);
    X = ones(3);
    Y = ones(3, 1);
    X = [1,sum(x)/N,sum(x.^2)/N;sum(x)/N,sum(x.^2)/N,sum(x.^3)/N;sum(x.^2)/N,sum(x.^3)/N,sum(x.^4)/N];
    Y = [sum(y)/N;sum(x'*y)/N;sum((x.^2)'*y)/N]
    disp(size(X));
    disp(size(Y));
    W = X\Y;
    scatter(x, y, 'filled', 'g');
    hold on;
    xe = linspace(min(x), max(x), 1000);
    ye = W(1) + W(2)*xe + W(3)*(xe.^2);
    plot(xe, ye, 'r');
end
