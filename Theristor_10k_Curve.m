clear all;
% ==============================================================================
%Copy and paste the dataset into a .text file
%Now load the dataset from the .txt file and store it in a variable
%The first column of the dataset is the temperature in Fahrenheit
%The second column of the dataset is the temperature in Celcius
%The third column of the dataset is the value of resistance
data = load('Thermistor_10k_Bapi.txt');

Temp = data(:,2)';           %Temperature in cel
TRes = data(:,3)';

% ==============================================================================
%Using voltage dedvider law to establish relationship between temperature & voltage  
RPDown = 10000;              %10k pull down resistor with thermistor
Den = TRes + RPDown ;        
Num = RPDown * 5;            % Assuming 5vollts input voltage 

Volt = (Num ./ Den);

% ==============================================================================
%This temperature vs voltage dataset is the taining set for the regression
%The equation will be like : y = ax^(n) + bx^(n-1) + ... + cx^(1)+kx^(0)
%The coefficients will be automatically calculated by the polyfit() function
coeff = polyfit(Volt,Temp,3);
y = polyval(coeff,Volt);

plot(Volt,Temp,'x');
hold;
plot(Volt,y);
xlabel('Voltage');
ylabel('Temperature'); 
% ==============================================================================

