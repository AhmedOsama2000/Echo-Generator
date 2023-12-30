function output = echo_gen(input, fs, delay, amp)
    % Function to add an echo effect to an audio recording
    
    % Calculate the number of points needed to achieve the specified delay
    delayPoints = round(delay * fs);
    
    % Create an array of zeros to represent the delay
    echo = zeros(length(input) + delayPoints, 1);
    
    % Copy the input into the appropriate position in the echo array
    echo(1:length(input)) = input;
    
    % Add the delayed input with amplification
    echo(delayPoints+1:end) = echo(delayPoints+1:end) + amp * input;
      
    % Sum the original input and the delayed input
    output = echo;
    
    % Scale the entire vector to ensure values are within the range [-1, 1]
    output = output / max(abs(output));

end