% FilterAndConvolveSignals.m

x = load('/MATLAB Drive/INPUT-SIGNAL-X(t).txt');  % Ensure the input signal is appropriately formatted
y = load('/MATLAB Drive/OUTPUT-SIGNAL-Y(t).txt');

% Define filters
% Extremely conservative low-pass filter
hlp = fir1(10000, 0.02, 'low');   % Lower cutoff and higher order
% High-pass filter with an even higher cutoff
hhp = fir1(10000, 0.5, 'high');   % High cutoff frequency
% Narrow band-pass filter focused on higher frequencies
hbp = fir1(10000, [0.4 0.7], 'bandpass');   % Higher frequency band

% Convolve the input signal with the filters
ylp = conv(x, hlp, 'same');
yhp = conv(x, hhp, 'same');
ybp = conv(x, hbp, 'same');

% Compute correlations
corr_lp = corrcoef(ylp, y);
corr_hp = corrcoef(yhp, y);
corr_bp = corrcoef(ybp, y);

% Print filtered outputs and correlation values
fprintf('\nLow Pass Filter Output (first 10 samples): %s\n', mat2str(ylp(1:10)));
fprintf('High Pass Filter Output (first 10 samples): %s\n', mat2str(yhp(1:10)));
fprintf('Band Pass Filter Output (first 10 samples): %s\n', mat2str(ybp(1:10)));

% Get the maximum correlation
max_corr = max([corr_lp(1,2), corr_hp(1,2), corr_bp(1,2)]);

fprintf('\nCorrelation with Low Pass Filter Output: %f\n', corr_lp(1,2));
fprintf('Correlation with High Pass Filter Output: %f\n', corr_hp(1,2));
fprintf('Correlation with Band Pass Filter Output: %f\n', corr_bp(1,2));


% Determine which filter has the highest correlation
if max_corr == corr_lp(1,2)
    best_match = 'Low Pass Filter';
elseif max_corr == corr_hp(1,2)
    best_match = 'High Pass Filter';
else
    best_match = 'Band Pass Filter';
end

% Display the result
fprintf('The best matching filter with the given output signal is: %s\n', best_match);

% Plotting
figure;
subplot(5, 1, 1);
plot(x, 'b');
title('Input Signal x(t)');
xlabel('Time');
ylabel('Amplitude');

subplot(5, 1, 2);
plot(y, 'k');
title('Given Output Signal y(t)');
xlabel('Time');
ylabel('Amplitude');

subplot(5, 1, 3);
plot(ylp, 'r');
title('Low Pass Filter Output ylp(t)');
xlabel('Time');
ylabel('Amplitude');

subplot(5, 1, 4);
plot(yhp, 'g');
title('High Pass Filter Output yhp(t)');
xlabel('Time');
ylabel('Amplitude');

subplot(5, 1, 5);
plot(ybp, 'm');
title('Band Pass Filter Output ybp(t)');
xlabel('Time');
ylabel('Amplitude');