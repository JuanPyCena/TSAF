close all;
clear all;
clc;

DATA = importdata('passow_2017_DataLevel1.asc');
text_data = DATA.textdata;
DATA_z1 = importdata('zarrenthin_2017_DataLevel1_FILE1.asc.csv',';');
text_data_zarr1 = DATA_z1.textdata;
DATA_z2 = importdata('zarrenthin_2017_DataLevel1_FILE2.asc.csv',';');
text_data_zarr2 = DATA_z2.textdata;
DATA_z3 = importdata('zarrenthin_2017_DataLevel1_FILE3.asc.csv',';');
text_data_zarr3 = DATA_3.textdata;

% Bereiche ohne Messdaten Passau
datenleck1_begin = 9498;
datenleck1_end = 9552;
datenleck2_begin = 18440;
datenleck2_end = 18523;
datenleck3_begin = 28897;
datenleck3_end = 28902;

%%
% Temperatur
temp1 = cellfun(@str2num,{text_data{2:datenleck1_begin,2}});
temp2 = cellfun(@str2num,{text_data{datenleck1_end:datenleck2_begin,2}});
temp3 = cellfun(@str2num,{text_data{datenleck2_end:datenleck3_begin,2}});
temp4 = cellfun(@str2num,{text_data{datenleck3_end:end,2}});
temp = [temp1 temp2 temp3 temp4];

% Indizes Ausreisser
at1 = austemp(temp1);
at2 = austemp(temp2); 
at3 = austemp(temp3);
at4 = austemp(temp4);

%%
% Druck
pressure1 = cellfun(@str2num,{text_data{2:datenleck1_begin,4}});
pressure2 = cellfun(@str2num,{text_data{datenleck1_end:datenleck2_begin,4}});
pressure3 = cellfun(@str2num,{text_data{datenleck2_end:datenleck3_begin,4}});
pressure4 = cellfun(@str2num,{text_data{datenleck3_end:end,4}});
pressure = [pressure1 pressure2 pressure3 pressure4];

% Indizes Ausreisser
ap1 = auspre(pressure1);
ap2 = auspre(pressure2);
ap3 = auspre(pressure3);
ap4 = auspre(pressure4);

%%
%relative Luftfeuchtigkeit
humidity1 = cellfun(@str2num,{text_data{2:datenleck1_begin,5}});
humidity2 = cellfun(@str2num,{text_data{datenleck1_end:datenleck2_begin,5}});
humidity3 = cellfun(@str2num,{text_data{datenleck2_end:datenleck3_begin,5}});
humidity4 = cellfun(@str2num,{text_data{datenleck3_end:end,5}});
humidity = [humidity1 humidity2 humidity3 humidity4];

% Indizes Ausreisser
ah1 = aushum(humidity1);
ah2 = aushum(humidity2);
ah3 = aushum(humidity3);
ah4 = aushum(humidity4);

%%
% Windgeschwindigkeit
wind1 = cellfun(@str2num,{text_data{2:datenleck1_begin,8}});
wind2 = cellfun(@str2num,{text_data{datenleck1_end:datenleck2_begin,8}});
wind3 = cellfun(@str2num,{text_data{datenleck2_end:datenleck3_begin,8}});
wind4 = cellfun(@str2num,{text_data{datenleck3_end:end,8}});
wind = [wind1 wind2 wind3 wind4];

% Indizes Ausreisser
aw1 = auswind(wind1);
aw2 = auswind(wind2);
aw3 = auswind(wind3);
aw4 = auswind(wind4);

%%
%plots Voranalyse

% Temperatur
figure()
subplot(2,2,1)
plot (temp1)
hold on
plot(at1,temp1(at1),'*','MarkerSize',8)
xlim([0 9409])
xticks([0 2978 5666 8642])
xticklabels({'Jan','Feb','Mar','Apr'})
ylim([-10 30])
ylabel('T [°C]')
title('Temperature (01 Jan - 08 Apr)')
hold off

subplot(2,2,2)
plot(temp2)
hold on
plot(at2,temp2(at2),'*','MarkerSize',8)
xlim([50 8831])
xticks([50 1824 4800 7680])
xticklabels({'11 Apr','May','Jun','Jul'})
ylim([-10 30])
ylabel('T [°C]')
title('Temperature (11 Apr - 11 Jul)')
hold off

subplot(2,2,3)
plot(temp3)
hold on
plot(at3,temp3(at3),'*','MarkerSize',8)
xlim([7 10367])
xticks([7 2304 5280 8160])
xticklabels({'13 Jul','Aug','Sep','Oct'})
ylim([-10 30])
ylabel('T [°C]')
title('Temperature (13 Jul - 28 Oct)')
hold off

subplot(2,2,4)
plot(temp4)
xlim([188 6047])
xticks([188 3068])
xticklabels({'Nov','Dec'})
ylim([-10 30])
ylabel('T [°C]')
title('Temperature (01 Nov - 31 Dec)')
print('temperature','-dpng')

% Druck
figure()
subplot(2,2,1)
plot(pressure1)
xlim([0 9409])
xticks([0 2978 5666 8642])
xticklabels({'Jan','Feb','Mar','Apr'})
ylim([600 1040])
ylabel('p [mbar]')
title('Barometric Pressure (01 Jan - 08 Apr)')

subplot(2,2,2)
plot(pressure2)
hold on
plot(ap2(1),pressure2(ap2(1)),'*','MarkerSize',8)
xlim([50 8831])
xticks([50 1824 4800 7680])
xticklabels({'11 Apr','May','Jun','Jul'})
ylim([600 1040])
ylabel('p [mbar]')
title('Barometric Pressure (11 Apr - 11 Jul)')
hold off

subplot(2,2,3)
plot(pressure3)
xlim([7 10367])
xticks([7 2304 5280 8160])
xticklabels({'13 Jul','Aug','Sep','Oct'})
ylim([600 1040])
ylabel('p [mbar]')
title('Barometric Pressure (13 Jul - 28 Oct)')

subplot(2,2,4)
plot(pressure4)
xlim([188 6047])
xticks([188 3068])
xticklabels({'Nov','Dec'})
ylim([600 1040])
ylabel('p [mbar]')
title('Barometric Pressure (01 Nov - 31 Dec)')
print('barometric_pressure','-dpng')

% relative Luftfeuchtigkeit
figure()
subplot(2,2,1)
plot (humidity1)
xlim([0 9409])
xticks([0 2978 5666 8642])
xticklabels({'Jan','Feb','Mar','Apr'})
ylim([30 110])
ylabel('humidity [%]')
title('Humidity (01 Jan - 08 Apr)')

subplot(2,2,2)
plot(humidity2)
xlim([50 8831])
xticks([50 1824 4800 7680])
xticklabels({'11 Apr','May','Jun','Jul'})
ylim([30 110])
ylabel('humidity [%]')
title('Humidity (11 Apr - 11 Jul)')

subplot(2,2,3)
plot(humidity3)
xlim([7 10367])
xticks([7 2304 5280 8160])
xticklabels({'13 Jul','Aug','Sep','Oct'})
ylim([30 110])
ylabel('humidity [%]')
title('Humidity (13 Jul - 28 Oct)')

subplot(2,2,4)
plot(humidity4)
xlim([188 6047])
xticks([188 3068])
xticklabels({'Nov','Dec'})
ylim([30 110])
ylabel('humidity [%]')
title('Humidity (01 Nov - 31 Dec)')
print('humidity','-dpng')

% Windgeschwindigkeit
figure()
subplot(2,2,1)
plot (wind1)
xlim([0 9409])
xticks([0 2978 5666 8642])
xticklabels({'Jan','Feb','Mar','Apr'})
ylim([0 60])
ylabel('v_{wind} [km/h]')
title('Windspeed (01 Jan - 08 Apr)')

subplot(2,2,2)
plot(wind2)
hold on
plot(aw2,wind2(aw2),'*','MarkerSize',8)
xlim([50 8831])
xticks([50 1824 4800 7680])
xticklabels({'11 Apr','May','Jun','Jul'})
ylim([0 60])
ylabel('v_{wind} [km/h]')
title('Windspeed (11 Apr - 11 Jul)')

subplot(2,2,3)
plot(wind3)
xlim([7 10367])
xticks([7 2304 5280 8160])
xticklabels({'13 Jul','Aug','Sep','Oct'})
ylim([0 60])
ylabel('v_{wind} [km/h]')
title('Windspeed (13 Jul - 28 Oct)')

subplot(2,2,4)
plot(wind4)
xlim([188 6047])
xticks([188 3068])
xticklabels({'Nov','Dec'})
ylim([0 60])
ylabel('v_{wind} [km/h]')
title('Windspeed (01 Nov - 31 Dec)')
print('windspeed','-dpng')

%%
% Ausreisser ersetzt durch Mittelwert aus vorigen und nachfolgenden
% Wert

% Temperatur
temp1_b = temp1;
temp1_b(at1) = (temp1_b(at1+1)+temp1_b(at1-1))/2;

temp2_b = temp2;
for ii = 1:length(at2)
    temp2_b(at2(ii)) = (temp2_b(at2(ii)+1)+temp2_b(at2(ii)-1))/2;
end

temp3_b = temp3;
for ii = 1:length(at3)
    temp3_b(at3(ii)) = (temp3_b(at3(ii)+1)+temp3_b(at3(ii)-1))/2;
end

% Druck
pressure2_b = pressure2;
pressure2_b(ap2(1)) = (pressure2_b(ap2(1)+1)+pressure2_b(ap2(1)-1))/2;

% Windgeschwindigkeit
wind2_b = wind2;
wind2_b(aw2) = (wind2_b(aw2+1)+wind2_b(aw2-1))/2;

%% 9.4.2018_________________________________________________________ Julia
% Interpolieren über das datenleck3 (4 Messdaten fehlen)
x   = [1 , (datenleck3_end - datenleck3_begin) + 1];
xq  = [2; 3; 4; 5];                                       

%Temperatur
v               = [temp3_b(end), temp4(1)];
temp3_ip        = interp1(x,v,xq,'spline');
dataFFT.temp1       = temp1_b;
dataFFT.temp2       = temp2_b;
dataFFT.temp3       = [temp3_b temp3_ip' temp4];

%Luftdruck
v               = [pressure3(end), pressure4(1)];
pressure3_ip    = interp1(x,v,xq,'spline');
dataFFT.pressure1   = pressure1;
dataFFT.pressure2   = pressure2_b;
dataFFT.pressure3   = [pressure3 pressure3_ip' pressure4];

%Luftfeuchte
v               = [humidity3(end), humidity4(1)];
humidity3_ip    = interp1(x,v,xq,'spline');
dataFFT.humidity1   = humidity1;
dataFFT.humidity2   = humidity2;
dataFFT.humidity3   = [humidity3 humidity3_ip' humidity4];

%Windgeschwindigkeit
v               = [humidity3(end), humidity4(1)];
wind3_ip        = interp1(x,v,xq,'spline');
dataFFT.wind1       = wind1;
dataFFT.wind2       = wind2_b;
dataFFT.wind3       = [wind3 wind3_ip' wind4];

%dataFFT beinhaltet nun alle Daten zur weiteren Fouriertransformation

%% Fourier Transformation

%Fourier-transformieren
[dft, magn, phase] = f_doFFT(dataFFT);

%Plots

%temp1
figure
hold on
subplot(3,1,1)
plot(dataFFT.wind1)
title('Time Series')
subplot(3,1,2)
plot(magn.wind1)
xlabel('bins')
ylabel('Magnitude')
title('Magnitude')
subplot(3,1,3)
plot(phase.wind1)
title('Phase')
hold off

% temp2
figure
hold on
subplot(3,1,1)
plot(dataFFT.wind2)
title('Time Series')
subplot(3,1,2)
plot(magn.wind2)
xlabel('bins')
ylabel('Magnitude')
title('Magnitude')
subplot(3,1,3)
plot(phase.wind2)
title('Phase')
hold off

% temp3
figure
hold on
subplot(3,1,1)
plot(dataFFT.wind3)
title('Time Series')
subplot(3,1,2)
plot(magn.wind3)
xlabel('bins')
ylabel('Magnitude')
title('Magnitude')
subplot(3,1,3)
plot(phase.wind3)
title('Phase')
hold off

%% Magnitudenspektrum

% temp3
figure
hold on
subplot(3,1,1)
plot(magn.wind1)
title('Magnitude temp1')
subplot(3,1,2)
plot(magn.wind2)
xlabel('bins')
ylabel('Magnitude')
title('Magnitude temp2')
subplot(3,1,3)
plot(magn.wind3)
title('Magnitude temp3')
hold off




