input_bits = 8;

% left logic shift by 3 bits
file_input_logic_left_shift = fopen('gaire_fixed_shift_logic_left_input.txt', 'w');
file_output_logic_left_shift = fopen('gaire_fixed_shift_logic_left_expected_output.txt', 'w');
for i = 0:(2^8-1)
        for j = 0:1
            input_bin = dec2bin(i,8);
            fprintf(file_input_logic_left_shift, '%d %s\n', j, input_bin);
            if j == 0
                fprintf(file_output_logic_left_shift, '%s\n', input_bin);
            else
                fprintf(file_output_logic_left_shift, '%s\n', logic_left_shift(input_bin, "011"));
            end
        end
end  

% right logic shift by 3 bits
file_input_logic_left_shift = fopen('gaire_fixed_shift_logic_right_input.txt', 'w');
file_output_logic_left_shift = fopen('gaire_fixed_shift_logic_right_expected_output.txt', 'w');
for i = 0:(2^8-1)
        for j = 0:1
            input_bin = dec2bin(i,8);
            fprintf(file_input_logic_left_shift, '%d %s\n', j, input_bin);
            if j == 0
                fprintf(file_output_logic_left_shift, '%s\n', input_bin);
            else
                fprintf(file_output_logic_left_shift, '%s\n', logic_right_shift(input_bin, "011"));
            end
        end
end  

% rotate left shift by 3 bits
file_input_logic_left_shift = fopen('gaire_fixed_shift_rotate_left_input.txt', 'w');
file_output_logic_left_shift = fopen('gaire_fixed_shift_rotate_left_expected_output.txt', 'w');
for i = 0:(2^8-1)
        for j = 0:1
            input_bin = dec2bin(i,8);
            fprintf(file_input_logic_left_shift, '%d %s\n', j, input_bin);
            if j == 0
                fprintf(file_output_logic_left_shift, '%s\n', input_bin);
            else
                fprintf(file_output_logic_left_shift, '%s\n', rotate_left_shift(input_bin, "011"));
            end
        end
end 

% rotate right shift by 3 bits
file_input_logic_left_shift = fopen('gaire_fixed_shift_rotate_right_input.txt', 'w');
file_output_logic_left_shift = fopen('gaire_fixed_shift_rotate_right_expected_output.txt', 'w');
for i = 0:(2^8-1)
        for j = 0:1
            input_bin = dec2bin(i,8);
            fprintf(file_input_logic_left_shift, '%d %s\n', j, input_bin);
            if j == 0
                fprintf(file_output_logic_left_shift, '%s\n', input_bin);
            else
                fprintf(file_output_logic_left_shift, '%s\n', rotate_right_shift(input_bin, "011"));
            end
        end
end 
    
