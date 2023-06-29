%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   OPTIMAL CONTROL APPLIED IN CANCER CHEMOTHERAPY   %%
%%%   By Janvier Nshimyumukiza, December 2020          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear all
clc

flag=0;
flag1=0;
flag2=0;
flag3=0;
while(flag==0)
    var = input('Enter a non-negative value for the first weight parameter "a": ');
    if(var<0)
        disp('           ')
        disp('ERROR: "a" must be non-negative.')
        disp('          ')
    else
        flag=1;
        a=var;
    end
end
flag=0;
disp('           ')
while(flag==0)
    var = input('Enter a positive value for the second weight parameter "b": ');
    if(var<=0)
        disp('           ')
        disp('ERROR: b must be positive.')
        disp('           ')
    else
        flag=1;
        b=var;
    end
end
flag=0;
disp('           ')
while(flag==0)
    var = input('Enter a positive value for the tumor growth rate r: ');
    if(var<=0)
        disp('              ')
        disp('ERROR: r must be positive.')
        disp('              ')
    else
        flag=1;
        r=var;
    end
end
flag=0;
disp('              ')
while(flag==0)
    var = input('Enter a positive value for the magnitude DELTA of the drug: ');
    if(var<=0)
        disp('              ')
        disp('ERROR: magnitude must be positive.')
        disp('              ')
     else
        flag=1;
        delta=var;
     end
end

disp('              ')
N0 = input('Enter the initial condition of the tumor state (N_0): ');
disp('              ')
Nd = input('Enter the desired level of the tumor state (N_d): ');
disp('              ')
disp('One moment please...')
y1=chemo(a,b,r,delta,N0,Nd);
disp('              ')
while(flag1==0)
    disp('Would you like to plot')
    disp('  1. state on optimal path (x^*)')
    disp('  2. adjoint (lambda)')
    disp('  3. optimal control (u^*)')
    disp('  4. state (x^*) and optimal control (u^*)')
    disp('  5. all three')
    var1=input('Type 1, 2, 3, or 4: ');
    
    if((var1==1) | (var1==2) | (var1==3) | (var1==4)|var1==5)
        flag1=1;
        disp('              ')
        while(flag2==0)
            disp('Would you like to vary any parameters?')
            disp('1. Yes')
            disp('2. No')
            var2=input('Type 1 or 2: ');

            if(var2==1)
                disp('              ')
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
                        disp('              ')
                        a2=input('Enter a second "a" value: ');
                        disp('              ')
                        disp('One moment please...')
                        y2=chemo(a2,b,r,delta,N0,Nd);
                        flag3=1;
                    elseif(var3==2)
                        disp('              ')
                        b2=input('Enter a second b value: ');
                        disp('          ')
                        disp('One moment please...')
                        y2=chemo(a,b2,r,delta,N0,Nd);
                        flag3=1;
                    elseif(var3==3)
                        disp('          ')
                        r2=input('Enter a second r value: ');
                        disp('          ')
                        disp('One moment please...')
                        y2=chemo(a,b,r2,delta,N0,Nd);
                        flag3=1;
                    elseif(var3==4)
                        disp('          ')
                        delta2=input('Enter a second delta value: ');
                        disp('          ')
                        disp('One moment please...')
                        y2=chemo(a,b,r,delta2,N0,Nd);
                        flag3=1;
                    elseif(var3==5)
                        disp('          ')
                        N02=input('Enter a second N_0 value: ');
                        disp('          ')
                        disp('One moment please...')
                        y2=chemo(a,b,r,delta,N02,Nd);
                        flag3=1;
                    elseif(var3==6)
                        disp('          ')
                        Nd2=input('Enter a second Nd value: ');
                        disp('          ')
                        disp('One moment please...')
                        y2=chemo(a,b,r,delta,N0,Nd2);
                        flag3=1;
                    else
                        disp('          ')
                        disp('Pardon?')
                        disp('          ')
                    end
                end
            elseif(var2==2)
                disp(' ')
                flag2=1;
                if(var1==1)
                    plot(y1(1,:),y1(2,:),'linewidth',2)
                    % 6/28/20 12:14 AM C:\Users\JANVIROSS\Document...\chemorun.m 4 of 6
                    xlabel('Time')
                    ylabel('State')
                elseif(var1==2)
                    plot(y1(1,:),y1(3,:),'linewidth',2)
                    if(a==0)
                        axis([0 1 -1 1])
                    end
                    xlabel('Time')
                    ylabel('Adjoint')
                elseif(var1==3)
                    plot(y1(1,:),y1(4,:),'linewidth',2)
                    if(a==0)
                        axis([0 1 -1 1])
                    end
                    xlabel('Time')
                    ylabel('Control')
                elseif(var1==4)
                    subplot(2,1,1);plot(y1(1,:),y1(2,:),'linewidth',2)
                    subplot(2,1,1);xlabel('Time')
                    subplot(2,1,1);ylabel('State')
                    subplot(2,1,2);plot(y1(1,:),y1(4,:),'linewidth',2)
                    if(a==0)
                        axis([0 1 -1 1])
                    end
                    subplot(2,1,2);xlabel('Time')
                    subplot(2,1,2);ylabel('Control')
                elseif(var1==5)
                    subplot(3,1,1);plot(y1(1,:),y1(2,:),'linewidth',2)
                    subplot(3,1,1);xlabel('Time')
                    subplot(3,1,1);ylabel('State')
                    subplot(3,1,2);plot(y1(1,:),y1(3,:),'linewidth',2)
                    if(a==0)
                        axis([0 1 -1 1])
                    end
                    subplot(3,1,2);xlabel('Time')
                    subplot(3,1,2);ylabel('Adjoint')
                    subplot(3,1,3);plot(y1(1,:),y1(4,:),'linewidth',2)
                    if(a==0)
                        axis([0 1 -1 1])
                    end
                    subplot(3,1,3);xlabel('Time')
                    subplot(3,1,3);ylabel('Control')
                    end
            
                else
                    disp(' ')
                    disp('Pardon?')
                    disp(' ')
                end
            end
            % 6/28/20 12:14 AM C:\Users\JANVIROSS\Document...\chemorun.m 5 of 6
    else
        disp('          ')
        disp('Pardon?')
        disp('          ')
    end
end
if(var2==1)
    if(var1==1)
        plot(y1(1,:),y1(2,:),'b-',y2(1,:),y2(2,:),'r-','linewidth',2)
        xlabel('Time')
        ylabel('State')
        legend('First value','Second value',0)
    elseif(var1==2)
        plot(y1(1,:),y1(3,:),'b-',y2(1,:),y2(3,:),'r-','linewidth',2)
        if(a==0)
            axis([0 1 -1 1])
        end
        xlabel('Time')
        ylabel('Adjoint')
        legend('First value','Second value',0)
    elseif(var1==3)
        plot(y1(1,:),y1(4,:),'b-',y2(1,:),y2(4,:),'r-','linewidth',2)
        if(a==0)
            axis([0 1 -1 1])
        end
        xlabel('Time')
        ylabel('Control')
        legend('First value','Second value',0)
    elseif(var1==4)
        subplot(2,1,1);plot(y1(1,:),y1(2,:),'b-',y2(1,:),y2(2,:),'r-','linewidth',2)
        subplot(2,1,1);legend('First value','Second value',0)
        subplot(2,1,1);ylabel('State')
        subplot(2,1,1);xlabel('Time')
        subplot(2,1,2);plot(y1(1,:),y1(4,:),'b-',y2(1,:),y2(4,:),'r-','linewidth',2)
        if(a==0)
            axis([0 1 -1 1])
        end
        subplot(2,1,2);xlabel('Time')
        subplot(2,1,2);ylabel('Control')
        subplot(2,1,2);legend('First value','Second value',0)
    elseif(var1==5)
        subplot(3,1,1);plot(y1(1,:),y1(2,:),'b-',y2(1,:),y2(2,:),'r-','linewidth',2)
        subplot(3,1,1);legend('First value','Second value',0)
        subplot(3,1,1);ylabel('State')
        subplot(3,1,1);xlabel('Time')
        subplot(3,1,2);plot(y1(1,:),y1(3,:),'b-',y2(1,:),y2(3,:),'r-','linewidth',2)
        if(a==0)
            axis([0 1 -1 1])
        end
        subplot(3,1,2);xlabel('Time')
        % 6/28/20 12:14 AM C:\Users\JANVIROSS\Document...\chemorun.m 6 of 6
        subplot(3,1,2);ylabel('Adjoint')
        subplot(3,1,2);legend('First value','Second value',0)
        subplot(3,1,3);plot(y1(1,:),y1(4,:),'b-',y2(1,:),y2(4,:),'r-','linewidth',2)
        if(a==0)
            axis([0 1 -1 1])
        end
        subplot(3,1,3);xlabel('Time')
        subplot(3,1,3);ylabel('Control')
        subplot(3,1,3);legend('First value','Second value',0)
    end
end

