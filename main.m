close all;
clear all;
clc;

DATA = importdata('passow_2017_DataLevel1.asc');
text_data = DATA.textdata;
% DATA_2 = importdata('sassen_2017_DataLevel1.asc');
% text_data_sassen = DATA_2.textdata;

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
