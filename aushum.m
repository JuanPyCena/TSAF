function [a] = aushum(humidity)
% sucht alle Daten bei denen der Unterschied zwischen 2 Datenpunkten (15
% min) grösser als 30% ist
aus = zeros(length(humidity),1);
for ii = 2:length(humidity)-1
    if abs(humidity(ii)-humidity(ii-1)) > 30
        aus(ii) = ii;
    end
end
a = nonzeros(aus);
end

