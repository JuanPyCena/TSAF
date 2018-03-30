close all;
clear all;
clc;

DATA = importdata('passow_2017_DataLevel1.asc');
text_data = DATA.textdata;

% Bereiche ohne Messdaten
datenleck1_begin = 9498;
datenleck1_end = 9552;
datenleck2_begin = 18440;
datenleck2_end = 18523;
datenleck3_begin = 28897;
datenleck3_end = 28902;

% Temperatur
temp1 = cellfun(@str2num,{text_data{2:datenleck1_begin,2}});
temp2 = cellfun(@str2num,{text_data{datenleck1_end:datenleck2_begin,2}});
temp3 = cellfun(@str2num,{text_data{datenleck2_end:datenleck3_begin,2}});
temp4 = cellfun(@str2num,{text_data{datenleck3_end:end,2}});
temp = [temp1 temp2 temp3 temp4];

% Druck
pressure1 = cellfun(@str2num,{text_data{2:datenleck1_begin,4}});
pressure2 = cellfun(@str2num,{text_data{datenleck1_end:datenleck2_begin,4}});
pressure3 = cellfun(@str2num,{text_data{datenleck2_end:datenleck3_begin,4}});
pressure4 = cellfun(@str2num,{text_data{datenleck3_end:end,4}});
pressure = [pressure1 pressure2 pressure3 pressure4];

hold on
plot (temp./20)
plot (pressure./1013)
hold off