function [w0, w1]= plot_linear_reg(data)
    x = data(:,2);
    y = data(:,3);
    n = length(x);
    xave = sum(x) / n;
    yave = sum(y) / n;
    xyave = sum(x' * y)/n;
    x2ave = sum(x .^ 2)/n;
    w1 = (xyave - xave*yave) / (x2ave - xave*xave);
    w0 = yave - w1*xave;
    scatter(x, y, 'filled', 'b');
    hold on;
    X = linspace(min(x), max(x), n);
    Y = w0 + w1 * X;
    plot(X, Y, 'r');
    hold off;
end