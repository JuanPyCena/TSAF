function [a] = auspre(pressure)
% sucht alle Daten bei denen der Unterschied zwischen 2 Datenpunkten (15
% min) grösser als 50 mbar ist
aus = zeros(length(pressure),1);
for ii = 2:length(pressure)-1
    if abs(pressure(ii)-pressure(ii-1)) > 50
        aus(ii) = ii;
    end
end
a = nonzeros(aus);
end


