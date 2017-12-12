% 1 bit register
% n bit register
% it is easier to create the input and expected output text files for register manually. So, I created them without using matlab.

% 5 to 16 bit sign extender
file_input_5 = fopen('gaire_5_to_16_bit_sign_extender_input.txt', 'w');
file_output_5 = fopen('gaire_5_to_16_bit_sign_extender_expected_output.txt', 'w');
% change the value of bits to change the size of input. for example if bits = 9, it will generate text files for 9 to 16 bits sign extender
bits = 5; 
for input_numbers = 0:(2^bits-1)
    for reset = 0:1
        if reset == 1
            output = '0000000000000000';
        else
            input_number_bin = dec2bin(input_numbers, bits);
            if input_number_bin(1)== '1'
                output = cat(2, '1111111', input_number_bin);
            else
                output = cat(2, '0000000', input_number_bin);
            end
        end
        fprintf(file_input_5, "%s %s\n", int2str(reset), input_number_bin);
        fprintf(file_output_5, "%s\n", output);
    end
end

% 6 to 16 bit sign extender
file_input_6 = fopen('gaire_6_to_16_bit_sign_extender_input.txt', 'w');
file_output_6 = fopen('gaire_6_to_16_bit_sign_extender_expected_output.txt', 'w');
% change the value of bits to change the size of input. for example if bits = 9, it will generate text files for 9 to 16 bits sign extender
bits = 6; 
for input_numbers = 0:(2^bits-1)
    for reset = 0:1
        if reset == 1
            output = '0000000000000000';
        else
            input_number_bin = dec2bin(input_numbers, bits);
            if input_number_bin(1)== '1'
                output = cat(2, '1111111', input_number_bin);
            else
                output = cat(2, '0000000', input_number_bin);
            end
        end
        fprintf(file_input_6, "%s %s\n", int2str(reset), input_number_bin);
        fprintf(file_output_6, "%s\n", output);
    end
end

%  8 to 16 bit zero extender
file_input_8 = fopen('gaire_8_to_16_bit_zero_extender_input.txt', 'w');
file_output_8 = fopen('gaire_8_to_16_bit_zero_extender_expected_output.txt', 'w');
bits = 8;
for input_numbers = 0:(2^bits-1)
    for reset = 0:1
        if reset == 1
            output = '0000000000000000';
        else
            input_number_bin = dec2bin(input_numbers, bits);
            output = cat(2, '00000000', input_number_bin);
        end
        fprintf(file_input_8, "%s %s\n", int2str(reset), input_number_bin);
        fprintf(file_output_8, "%s\n", output);
    end
end

% 9 to 16 bit sign extender
file_input_9 = fopen('gaire_9_to_16_bit_sign_extender_input.txt', 'w');
file_output_9 = fopen('gaire_9_to_16_bit_sign_extender_expected_output.txt', 'w');
% change the value of bits to change the size of input. for example if bits = 9, it will generate text files for 9 to 16 bits sign extender
bits = 9; 
for input_numbers = 0:(2^bits-1)
    for reset = 0:1
        if reset == 1
            output = '0000000000000000';
        else
            input_number_bin = dec2bin(input_numbers, bits);
            if input_number_bin(1)== '1'
                output = cat(2, '1111111', input_number_bin);
            else
                output = cat(2, '0000000', input_number_bin);
            end
        end
        fprintf(file_input_9, "%s %s\n", int2str(reset), input_number_bin);
        fprintf(file_output_9, "%s\n", output);
    end
end

% 11 to 16 bit sign extender
file_input_11 = fopen('gaire_11_to_16_bit_sign_extender_input.txt', 'w');
file_output_11 = fopen('gaire_11_to_16_bit_sign_extender_expected_output.txt', 'w');
% change the value of bits to change the size of input. for example if bits = 9, it will generate text files for 9 to 16 bits sign extender
bits = 11; 
for input_numbers = 0:(2^bits-1)
    for reset = 0:1
        if reset == 1
            output = '0000000000000000';
        else
            input_number_bin = dec2bin(input_numbers, bits);
            if input_number_bin(1)== '1'
                output = cat(2, '1111111', input_number_bin);
            else
                output = cat(2, '0000000', input_number_bin);
            end
        end
        fprintf(file_input_11, "%s %s\n", int2str(reset), input_number_bin);
        fprintf(file_output_11, "%s\n", output);
    end
end
