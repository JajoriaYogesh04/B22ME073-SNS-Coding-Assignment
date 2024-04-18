# B22ME073-SNS-Coding-Assignment
This script performs signal filtering and correlation analysis on an input signal and an output signal. 
It uses three different filters: low-pass, high-pass, and band-pass, to filter the input signal and compute the correlation between the filtered signals and the given output signal. 
It then identifies which filter yields the highest correlation with the output signal.

Requirement

- MATLAB installed on your system
- The following files must be present in the working directory or in a specified path:
  - `INPUT-SIGNAL-X(t).txt`: Input signal data file in `.txt` format.
  - `OUTPUT-SIGNAL-Y(t).txt`: Output signal data file in `.txt` format.

Usage

1. Prepare the Input and Output Files:
    - Ensure the input signal file and output signal file are in a suitable format (text files) and located in the specified path.
  
2. Run the Script:
    - Open MATLAB and navigate to the directory where the script is saved.
    - Run the script in MATLAB.
    
3. Script Output:
    - The script will output:
        - The first 10 samples of each filtered signal (low-pass, high-pass, and band-pass).
        - The correlation coefficients between each filtered signal and the output signal.
        - The name of the filter that yields the highest correlation with the output signal.
    - Additionally, the script will generate a figure displaying the input signal, output signal, and the outputs of each filtered signal.

Filtering Details

- Low-Pass Filter:
    - The low-pass filter is designed with a low cutoff frequency (0.02) and high order (10,000 taps).
  
- High-Pass Filter
    - The high-pass filter is designed with a higher cutoff frequency (0.5) and high order (10,000 taps).
  
- Band-Pass Filter:
    - The band-pass filter is designed to focus on higher frequencies (between 0.4 and 0.7) and has a high order (10,000 taps).

Functionality Overview

1. Load the Input and Output Signals:
    - The script loads the input and output signals from the specified text files.
  
2. Define Filters:
    - The script creates three different filters (low-pass, high-pass, and band-pass) using the `fir1` function.
  
3. Convolve the Input Signal with the Filters:
    - The input signal is convolved with each of the three filters using the `conv` function.
  
4. Compute Correlations:
    - The script calculates the correlation coefficients between each filtered signal and the output signal using the `corrcoef` function.
  
5. Determine the Best Matching Filter:
    - The script identifies the filter that yields the highest correlation with the output signal and outputs its name.
  
6. Plotting:
    - The script generates a figure with five subplots showing the input signal, output signal, and filtered outputs (low-pass, high-pass, and band-pass).

GitHub link:
https://github.com/JajoriaYogesh04/B22ME073-SNS-Coding-Assignment/blob/3269ba47a837f292c2d40e4757cf84c54c7ff19a/README.md


