function [a] = austemp(temp)
% sucht alle Daten bei denen der Unterschied zwischen 2 Datenpunkten (15
% min) grösser als 5°C ist
aus = zeros(length(temp),1);
for ii = 2:length(temp)-1
    if abs(temp(ii)-temp(ii-1)) > 3
        aus(ii) = ii;
    end
end
a = nonzeros(aus);
end

