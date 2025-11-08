% Classical Ghost Imaging Simulation in MATLAB
% Modified for ECE 535 HW4 Problem 6(a)

clear all;
close all;
clc;

% Define parameters
width = 53;
height = 70;  % Dimensions of the image plane
num_patterns = 500;  % Use more patterns for better statistics

% --- 1. REPLACE THE IMAGING OBJECT ---
% Create a circular aperture as our object
object_img = zeros(width, height);
[cx, cy] = meshgrid(1:width, 1:height);
radius = 10;
mask = (cx - width/2).^2 + (cy - height/2).^2 <= radius^2;
object_img(mask) = 1;

% --- 2. DEFINE REGIONS OF INTEREST (ROIs) ---
% Signal ROI: A smaller region inside the bright circle
signal_roi_radius = 5;
signal_roi_mask = (cx - width/2).^2 + (cy - height/2).^2 <= signal_roi_radius^2;

% Background ROI: A region outside the circle (e.g., a corner)
bg_roi_size = 15; % Size of square background ROI
bg_roi_mask = false(width, height);
bg_roi_mask(1:bg_roi_size, 1:bg_roi_size) = 1;
% Ensure background ROI doesn't overlap with the object
bg_roi_mask(mask) = 0;

% --- 3. INITIALIZE ARRAYS TO STORE METRICS ---
avg_signal = zeros(1, num_patterns);
std_background = zeros(1, num_patterns);

% --- 4. GENERATE RANDOM INTENSITY PATTERNS ---
bucket_measurements = zeros(1, num_patterns);
patterns = zeros(width, height, num_patterns);
for k = 1:num_patterns
    pattern = rand(width, height);
    patterns(:,:,k) = pattern;
    transmitted_light = pattern .* object_img;
    bucket_measurements(k) = sum(transmitted_light, 'all');
end

% --- 5. MAIN LOOP: RECONSTRUCT WITH INCREASING NUMBER OF PATTERNS ---
for n = 1:num_patterns
    % Reconstruct the object image using only the first 'n' patterns
    reconstructed_img = zeros(width, height);
    for i = 1:width
        for j = 1:height
            pattern_series = squeeze(patterns(i, j, 1:n)); % Use first n patterns
            correlation = corr(bucket_measurements(1:n)', pattern_series);
            reconstructed_img(i, j) = correlation;
        end
    end
    
    % Calculate metrics for this reconstruction
    avg_signal(n) = mean(reconstructed_img(signal_roi_mask));
    std_background(n) = std(reconstructed_img(bg_roi_mask));
end

% --- 6. PLOTTING ---
% Plot 1: Average signal intensity vs. number of patterns
figure;
subplot(2, 2, 1);
plot(1:num_patterns, avg_signal, '-b');
xlabel('Number of Patterns');
ylabel('Average Pixel Intensity in Signal ROI');
title('Signal Build-up');
grid on;

% Plot 2: Standard deviation of background vs. number of patterns
subplot(2, 2, 2);
plot(1:num_patterns, std_background, '-r');
xlabel('Number of Patterns');
ylabel('Standard Deviation in Background ROI');
title('Background Noise');
grid on;

% Plot 3: Representative reconstructed image (using all patterns)
subplot(2, 2, 3:4);
imshow(reconstructed_img, []);
title('Final Reconstructed Image (All Patterns)');
hold on;
% Indicate ROIs on the image
contour(signal_roi_mask, 'g', 'LineWidth', 2); % Green contour for signal ROI
contour(bg_roi_mask, 'y', 'LineWidth', 2); % Yellow contour for background ROI
legend('Signal ROI', 'Background ROI');
hold off;
