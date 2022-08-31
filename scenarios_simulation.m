% These matlab/octave codes implements the numerical simulations of
% different scenarios that I have used in my undergraduate final year project
% entitled "APPLIED OPTIMAL CONTROL FOR CANCER CHEMOTHERAPY"

%===================================================================================
% scenario 1

% Here we need simple lines of code to run "chemo". Just define parameter
% values, run chemo and make a plot.

clear all
close all
clc

a= 3;
b= 1;
r= 0.10;
delta= 0.45;
N0= 0.975;
Nd= 0;

y=chemo(a,b,r,delta,N0,Nd);

subplot(2,1,1);plot(y(1,:),y(2,:),'b-','linewidth',1.4)
subplot(2,1,1);ylabel('State N(t)')
subplot(2,1,1);xlabel('Time');title('State N(t) on optimal path.');
subplot(2,1,2);plot(y(1,:),y(4,:),'b-','linewidth',1.4)
subplot(2,1,2);subplot(2,1,2); subplot(2,1,1);
subplot(2,1,2);xlabel('Time')
subplot(2,1,2);ylabel('Control u(t)');title('Optimal control u(t)');

%===================================================================================
% scenario 2

% Here you need simple lines of code to run "chemo". Just define parameter
% values, run chemo and make some plots with different initial state No.

clear all
close all
clc

a= 3;
b= 1;
r= 0.10;
delta= 0.45;
N01= 0.975;
N02= 0.750;
N03= 0.500;
Nd= 0;

y1=chemo(a,b,r,delta,N01,Nd);
y2=chemo(a,b,r,delta,N02,Nd);
y3=chemo(a,b,r,delta,N03,Nd);

subplot(2,1,1);plot(y1(1,:),y1(2,:),'r-',y2(1,:),y2(2,:),'b-',y3(1,:),y3(2,:),'g-','linewidth',1.4)
subplot(2,1,1);legend('N0 = 0.975','N0 = 0.750','N0 = 0.500',0);title('scenario 2','fontsize',10);
subplot(2,1,1);ylabel('State')
subplot(2,1,1);xlabel('Time');title('State N(t) on optimal path.');
subplot(2,1,2);plot(y1(1,:),y1(4,:),'r-',y2(1,:),y2(4,:),'b-',y3(1,:),y3(4,:),'g-','linewidth',1.4)
legend('N0 =0.975','N0 =0.75','N0 =0.50',0);  
subplot(2,1,2);xlabel('Time')
subplot(2,1,2);ylabel('Control');title('Optimal Control u(t)');

%===================================================================================
% scenario 3

% Here you need simple lines of code to run "chemo". Just define parameter
% values, run chemo and make some plots with different values of drug magnitude delta.

clear all
close all
clc

a= 3;
b= 1;
r= 0.10;
delta1 = 0.35;
delta2 = 0.45;
delta3 = 0.55;
delta4 = 0.65;
N0= 0.975;
Nd= 0;

y1=chemo(a,b,r,delta1,N0,Nd);
y2=chemo(a,b,r,delta2,N0,Nd);
y3=chemo(a,b,r,delta3,N0,Nd);
y4=chemo(a,b,r,delta4,N0,Nd);

subplot(2,1,1);plot(y1(1,:),y1(2,:),'r-',y2(1,:),y2(2,:),'b-',y3(1,:),y3(2,:),'g-',y4(1,:),y4(2,:),'-m','linewidth',1.4)
subplot(2,1,1);legend('delta =0.35','delta =0.45','delta =0.55','delta =0.65',0);title('scenario 3','fontsize',10);
subplot(2,1,1);ylabel('State')
subplot(2,1,1);xlabel('Time');title('State N(t) on optimal path.');
subplot(2,1,2);plot(y1(1,:),y1(4,:),'r-',y2(1,:),y2(4,:),'b-',y3(1,:),y3(4,:),'g-',y4(1,:),y4(4,:),'-m','linewidth',1.4)
legend('delta =0.35','delta =0.45','delta =0.55','delta =0.65',0);  
subplot(2,1,2);xlabel('Time')
subplot(2,1,2);ylabel('Control');title('Optimal Control u(t)');

%===================================================================================
% scenario 4

% Here you need simple lines of code to run "chemo". Just define parameter
% values, run chemo and make some plots with different growth rates.

clear all
close all
clc

a= 3;
b= 1;
r1= 0.05;
r2= 0.10;
r3= 0.15;
r4= 0.20;
delta = 0.45;
N0= 0.975;
Nd= 0;

y1=chemo(a,b,r1,delta,N0,Nd);
y2=chemo(a,b,r2,delta,N0,Nd);
y3=chemo(a,b,r3,delta,N0,Nd);
y4=chemo(a,b,r4,delta,N0,Nd);

subplot(2,1,1);plot(y1(1,:),y1(2,:),'r-',y2(1,:),y2(2,:),'b-',y3(1,:),y3(2,:),'g-',y4(1,:),y4(2,:),'-m','linewidth',1.4)
subplot(2,1,1);legend('r = 0.05','r = 0.10','r = 0.15','r = 0.20',0);title('scenario 4','fontsize',10);
subplot(2,1,1);ylabel('State')
subplot(2,1,1);xlabel('Time');title('State N(t) on optimal path.');
subplot(2,1,2);plot(y1(1,:),y1(4,:),'r-',y2(1,:),y2(4,:),'b-',y3(1,:),y3(4,:),'g-',y4(1,:),y4(4,:),'-m','linewidth',1.4)
legend('r = 0.05','r = 0.10','r = 0.15','r = 0.20',0);  
subplot(2,1,2);xlabel('Time')
subplot(2,1,2);ylabel('Control');title('Optimal Control u(t)');

%====================================================================================
