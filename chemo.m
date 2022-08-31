function m = chemo(p1,p2,p3,p4,p5,p6)
global a b r delta N0 Nd

a=p1;
b=p2;
r=p3;
delta=p4;
N0=p5;
Nd=p6;

solinit = bvpinit(linspace(0,5),@chemoinit);

sol = bvp4c(@chemoode,@chemobc,solinit,bvpset('RelTol',1e3));    %% Include the use of options,,, bvpset()

time = sol.x;
state = sol.y(1,:);
adjoint = sol.y(2,:);
control = (0.5/b)*delta*sol.y(1,:).*sol.y(2,:);
m(1,:) = time;
m(2,:) = state;
m(3,:) = adjoint;
m(4,:) = control;

%--------------------------------------------------------------------------
function dydt=chemoode(t,y)
global a b r delta N0 Nd

%N=y(1) ; lambda=y(2)  % Correct here
%THIS IS CORRECT!!!!..........................................
dydt=[r*y(1).*log(1./y(1))-delta^2*y(1).^2.*y(2) -(2*a*(y(1)-Nd)+y(2)*(r*log(1./y(1))-r-delta^2*y(1).*y(2)/(2*b)))];


%--------------------------------------------------------------------------
function res=chemobc(ya,yb)
global a b r delta N0 Nd

res=[ya(1) - N0 yb(2)];

%--------------------------------------------------------------------------
function v=chemoinit(t)
global a b r delta N0 Nd

v=[N0 0.0];
