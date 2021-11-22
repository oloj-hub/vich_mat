%заполнение матрицы
A = zeros(20,20);
f=zeros(20,1);
for i=1:20
    f(i)=1/i;
    for j=1:20
        if i~=j
            A(i,j)=1/(i+j);
        else
            A(i,j)=10;
        end
    end
end

%невязка метода Гаусса
u = Gauss(A,f);
r_gauss = norm(A*u - f)

%невязка метода Зейделя
v = Seidel(A,f);
r_seidel = norm(A*v - f)

%собственные значения A
e = eig(A);
lambda_max = max(e)
lambda_min = min(e)

%Число обусловленности
mu = lambda_max/lambda_min

%Метод Гаусса
function [u] = Gauss(A,f)
u = zeros(20,1);
%прямой ход
for i=1:19
    for j=i+1:20
        q = A(j,i)/A(i,i);
        for k=i:20
            A(j,k) =  A(j,k) - q*A(i,k);
        end
        f(j)=f(j)-q*f(i);
    end
end
%обратный ход
for i=20:-1:1
    u(i)=f(i);
    for j = 20:-1:i+1
        u(i) = u(i) - A(i,j)*u(j); 
    end
    u(i)=u(i)/A(i,i);
end
end

%Метод Зейделя
function [v] = Seidel(A,f)
U = triu(A,1);
D = diag(diag(A));
L = A - U - D;
R = -(L+D)^(-1)*U;
F = (L+D)^(-1)*f;
v=zeros(20,1);
while norm(R*v+F - v)>10^(-12)
    v = R*v + F;
end
end

