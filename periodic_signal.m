function [x] = periodic_signal(n, vx, fts, amps, phis)
    t = 0:n-1;
    k = 1:numel(amps); % numel(amps): number of elements of amps
    x = sum(amps' .* cos(2*pi*t*k*fts + (ones(n,1).*phis')),2);
    energy_per_sample = mean(x.^2) % https://www.dsprelated.com/freebooks/mdft/Signal_Metrics.html
    x = x .* sqrt(vx / energy_per_sample);
end
