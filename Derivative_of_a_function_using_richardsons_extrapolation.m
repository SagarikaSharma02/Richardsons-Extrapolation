%To find the derivative of a function using Richardson's Extrapolation
f = inline('x^3*cos(x)');
eps = input('Enter the allowed tolerance');
x0 = input('Enter the value of reference point');
n = input('Enter -the number of steps');
h1(1,1) = input('Enter the initial approximation');
g(1,1) = (f(x0 + h1(1,1)) - f(x0-h1(1,1)))/(2*h1(1,1));
for i = 2:n
    h1(i,1) = h1(i-1,1)/2;
    g(i,1) = (f(x0+h1(i,1)) - f(x0-h1(i,1)))/(2*h1(i,1));
    for j = 2:i
        g(i,j) = (4^(j-1)*g(i,j-1)-g(i-1,j-1))/(4^(j-1) - 1);
    end
    if (abs(g(i,i)-g(i,i-1))<=eps)
        break;
    elseif (i==n)
        error('Richardson extrapolation failed to converge');
    end
end

T = table(h1,double(g))
T.Properties.VariableNames = {'h1','g'};
T

        
    
    
    
    
    





    
    
    
    



