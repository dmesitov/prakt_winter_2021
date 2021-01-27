function X = shuttleNew(A, B)

n = size(A,1);
a=diag(A);
b=diag(A,1);
c=diag(A,-1);
P=zeros(n,1);
Q=zeros(n+1,1);
X=zeros(n,1);

P(2)= b(1)/(-a(1));
Q(2)= B(1)/(a(1));

for i = 2:(n-1)
P(i+1)=b(i)/(-a(i)-c(i-1)*P(i));
Q(i+1)=(-B(i)+c(i-1)*Q(i))/(-a(i)-c(i-1)*P(i));
end

Q(n+1)=(-B(n)+c(n-1)*Q(n))/(-a(n)-c(n-1)*P(n));
X(n)=Q(n+1);

for i = (n-1):-1:1
X(i) = P(i+1)*X(i+1)+ Q(i+1);
end

end
