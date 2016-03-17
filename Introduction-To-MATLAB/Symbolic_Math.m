%Symbolic math

clear all; close all; clc

%To make symbolic variables, use sym
a=sym('1/3');
b=sym('4/5');
d=a*b;
disp(d)

%Computes inverse symbolically
mat=sym([1 2;3 4]);
matInv=inv(mat);
disp(matInv)

%%
%Cleaning up Symbolic Statements
%makes it look nicer
syms c positive % declare c as positive symbolic type variable
mpoly=expand((a-c)^2);
disp(mpoly)
factor(mpoly)
pretty(mpoly)
%collects terms
syms a b r x y real
collect(3*x+4*y-1/3*x^2-x+3/2*y)
%simplifies expressions
simplify(cos(x)^2+sin(x)^2)
%Replaces variables with numbers or expressions.
subs('c^2',c,[x/7 5])
%compute the produc
mat=sym('[a b;c d]');
mat2=mat*[1 3;4 -2];
disp(mat2)
%compute the determinant
d=det(mat);
disp(d)
%find the inverse
i=inv(mat);
disp(i)
%You can access symbolic matrix elements as before
i(1,2)
%%
%Let E be the equation of a circle of radius r centered at (a,b)
%Solve E for x and then for
solve('(x-a)^2+(y-b)^2=r^2','x')
solve('(x-a)^2+(y-b)^2=r^2','y')
%%
%Integrate by parts. Use int to do the integral symbolically
Q=int(x*exp(x),a,b);
disp(Q)
%Compute the value by substituting 0 for a and 2 for b
subs(Q,{a,b},{0,2})