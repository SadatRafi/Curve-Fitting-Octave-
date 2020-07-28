clear all;

data = load('Thermistor_10k_Bapi.txt');

Temp = data(:,2)';
TRes = data(:,3)';

RPDown = 10000;               %10k pull down resistor with thermistor
Den = TRes + RPDown ;        
Num = RPDown * 5;            % Assuming 5vollts input voltage 

Volt = (Num ./ Den);

coeff = polyfit(Volt,Temp,3);
y = polyval(coeff,Volt);

plot(Volt,Temp,'x');
hold;
plot(Volt,y);
xlabel('Voltage');
ylabel('Temperature');
