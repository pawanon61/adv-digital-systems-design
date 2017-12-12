% logic left shift
input_bits = 8;

file_input = fopen('gaire_barrel_shifter_logic_left_input.txt', 'w');
file_output = fopen('gaire_barrel_shifter_logic_left_expected_output.txt', 'w');

for input = 0:2^input_bits-1
    for s_amt =0:7
        s_amt_bin = dec2bin(s_amt,3);
        input_bin = dec2bin(input,8);
        fprintf(file_input, "%s %s\n", input_bin, s_amt_bin);
        if s_amt_bin == '000'
            fprintf(file_output, "%s\n", logic_left_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '001'
            fprintf(file_output, "%s\n", logic_left_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '010'
            fprintf(file_output, "%s\n", logic_left_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '011'
            fprintf(file_output, "%s\n", logic_left_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '100'
            fprintf(file_output, "%s\n", logic_left_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '101'
            fprintf(file_output, "%s\n", logic_left_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '110'
            fprintf(file_output, "%s\n", logic_left_shift(input_bin, s_amt_bin));
        else
            fprintf(file_output, "%s\n", logic_left_shift(input_bin, s_amt_bin));
        end
    end
end
        
%logic right shift
input_bits = 8;

file_input = fopen('gaire_barrel_shifter_logic_right_input.txt', 'w');
file_output = fopen('gaire_barrel_shifter_logic_right_expected_output.txt', 'w');

for input = 0:2^input_bits-1
    for s_amt =0:7
        s_amt_bin = dec2bin(s_amt,3);
        input_bin = dec2bin(input,8);
        fprintf(file_input, "%s %s\n", input_bin, s_amt_bin);
        if s_amt_bin == '000'
            fprintf(file_output, "%s\n", logic_right_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '001'
            fprintf(file_output, "%s\n", logic_right_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '010'
            fprintf(file_output, "%s\n", logic_right_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '011'
            fprintf(file_output, "%s\n", logic_right_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '100'
            fprintf(file_output, "%s\n", logic_right_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '101'
            fprintf(file_output, "%s\n", logic_right_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '110'
            fprintf(file_output, "%s\n", logic_right_shift(input_bin, s_amt_bin));
        else
            fprintf(file_output, "%s\n", logic_right_shift(input_bin, s_amt_bin));
        end
    end
end

% rotate left shift
input_bits = 8;

file_input = fopen('gaire_barrel_shifter_rotate_left_input.txt', 'w');
file_output = fopen('gaire_barrel_shifter_rotate_left_expected_output.txt', 'w');

for input = 0:2^input_bits-1
    for s_amt =0:7
        s_amt_bin = dec2bin(s_amt,3);
        input_bin = dec2bin(input,8);
        fprintf(file_input, "%s %s\n", input_bin, s_amt_bin);
        if s_amt_bin == '000'
            fprintf(file_output, "%s\n", rotate_left_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '001'
            fprintf(file_output, "%s\n", rotate_left_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '010'
            fprintf(file_output, "%s\n", rotate_left_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '011'
            fprintf(file_output, "%s\n", rotate_left_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '100'
            fprintf(file_output, "%s\n", rotate_left_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '101'
            fprintf(file_output, "%s\n", rotate_left_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '110'
            fprintf(file_output, "%s\n", rotate_left_shift(input_bin, s_amt_bin));
        else
            fprintf(file_output, "%s\n", rotate_left_shift(input_bin, s_amt_bin));
        end
    end
end

% rotate right shift
input_bits = 8;

file_input = fopen('gaire_barrel_shifter_rotate_right_input.txt', 'w');
file_output = fopen('gaire_barrel_shifter_rotate_right_expected_output.txt', 'w');

for input = 0:2^input_bits-1
    for s_amt =0:7
        s_amt_bin = dec2bin(s_amt,3);
        input_bin = dec2bin(input,8);
        fprintf(file_input, "%s %s\n", input_bin, s_amt_bin);
        if s_amt_bin == '000'
            fprintf(file_output, "%s\n", rotate_right_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '001'
            fprintf(file_output, "%s\n", rotate_right_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '010'
            fprintf(file_output, "%s\n", rotate_right_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '011'
            fprintf(file_output, "%s\n", rotate_right_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '100'
            fprintf(file_output, "%s\n", rotate_right_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '101'
            fprintf(file_output, "%s\n", rotate_right_shift(input_bin, s_amt_bin));
        elseif s_amt_bin == '110'
            fprintf(file_output, "%s\n", rotate_right_shift(input_bin, s_amt_bin));
        else
            fprintf(file_output, "%s\n", rotate_right_shift(input_bin, s_amt_bin));
        end
    end
end