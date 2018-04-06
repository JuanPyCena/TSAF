function [a] = auswind(wind)
% sucht alle Daten bei denen der Unterschied zwischen 2 Datenpunkten (15
% min) grösser als 50 km/h ist
aus = zeros(length(wind),1);
for ii = 2:length(wind)-1
    if abs(wind(ii)-wind(ii-1)) > 20
        aus(ii) = ii;
    end
end
a = nonzeros(aus);
end

