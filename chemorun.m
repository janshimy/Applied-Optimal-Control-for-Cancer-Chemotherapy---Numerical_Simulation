clear all
clc
flag=0;
flag1=0;
flag2=0;
flag3=0;
while(flag==0)
var = input('Enter a non-negative value for the first weight parameter "a": ');
if(var<0)
disp(' ')
disp('ERROR: "a" must be non-negative.')
disp(' ')
else
flag=1;
a=var;
end
end
flag=0;
disp(' ')
while(flag==0)
    var = input('Enter a positive value for the second weight parameter "b": ');
    if(var<=0)
        disp(' ')
        disp('ERROR: b must be positive.')
        disp(' ')
    else
        flag=1;
        b=var;
    end
end
flag=0;
disp(' ')
while(flag==0)
    var = input('Enter a positive value for the tumor growth rate r: ');
    if(var<=0)
        disp(' ')
        disp('ERROR: r must be positive.')
        disp(' ')
    else
        flag=1;
        r=var;
    end
end
flag=0;
disp(' ')
while(flag==0)
    var = input('Enter a positive value for the magnitude DELTA of the drug: ');
    if(var<=0)
        disp(' ')
        disp('ERROR: magnitude must be positive.')
        disp(' ')
     else
        flag=1;
        delta=var;
     end
end
%======================================================================================================
%======================================================================================================
disp(' ')
N0 = input('Enter the initial condition of the state (N_0): ');
disp(' ')
Nd = input('Enter the desired level of the state (N_d): ');
disp(' ')
disp('One moment please...')
y1=chemo(a,b,r,delta,N0,Nd);
disp(' ')
while(flag1==0)
disp('Would you like to plot')
disp(' 1. state on optimal path (x^*)')
disp(' 2. adjoint (lambda)')
disp(' 3. optimal control (u^*)')
disp(' 4. state (x^*) and optimal control (u^*)')
disp(' 5. all three')
var1=input('Type 1, 2, 3, or 4: ');
if((var1==1) | (var1==2) | (var1==3) | (var1==4)|var1==5)
flag1=1;
disp(' ')
while(flag2==0)
disp('Would you like to vary any parameters?')
disp('1. Yes')
disp('2. No')
var2=input('Type 1 or 2: ');
if(var2==1)
disp(' ')
flag2=1;
while(flag3==0)
disp('Which parameter would you like to vary?')
disp('1. a')
disp('2. b')
disp('3. r')
disp('4. delta')
disp('5. N0')
disp('6. Nd')
var3=input('Type 1, 2, 3, 4, 5 or 6: ');
if(var3==1)
disp(' ')
a2=input('Enter a second "a" value: ');
