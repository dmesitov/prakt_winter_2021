clc;

hold on
for k = 5:10

    [X, Y] = FDE(1, (1/2)^k);
    1-((1/2)^(k-5))
    p = plot(X, Y, 'Color', [0 0 1  0.2 + (0.8/6)*(k-5)]);
    
end

function [X, Y] = FDE(eps, h)

a1 = 1;
a2 = 0;
b1 = 1;
b2 = 0;
g1 = 5;
g2 = 8;


p = @(x)(x * x + x);
q = @(x)(x - x * x);
f = @(x)(x * x * x - sqrt(x * x + x));

x0 = 0;
x1 = 1;

n = round(abs(x1 - x0) / h);
X = zeros(n + 1, 1);
F = zeros(n + 1, 1);
A = zeros(n + 1, n + 1);

for i = 1:n+1
    X(i) = x0 + (i - 1) * h;
end

for i = 2:n
    A(i, i)   = ((-2*eps) / (h * h)) + q(X(i));
    A(i, i-1) = (eps / (h * h)) - p(X(i)) / (2 * h);
    A(i, i+1) = (eps / (h * h)) + p(X(i)) / (2 * h);
    F(i)      = -f(X(i));
end

F(1)   = g1;
F(n+1) = g2;
A(1, 1) = (a1 / h) + a2;
A(1, 2) = -a1 / h;
A(n + 1, n + 1) = (b1 / h) + b2;
A(n + 1, n)     = -b1 / h;

Y = shuttleNew(A, F);
end
