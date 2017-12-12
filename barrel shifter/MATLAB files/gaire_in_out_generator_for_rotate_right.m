function y = gaire_in_out_generator_for_rotate_right()
amt_bits=3;  % to select the amount by which to shift the given binary number
input_bits = 8;  % number of input bits
%below are input and output files
file_input = fopen('gaire_rotate_right_input.txt', 'w');
file_output = fopen('gaire_rotate_right_expected_output.txt', 'w');

for i = 0:7
    amt_bin = dec2bin(i, amt_bits);
    for k = 0:10:255
        input_bits_bin = dec2bin(k, input_bits);
        fprintf(file_input, '%s\n', [amt_bin ' ' input_bits_bin]);
        fprintf(file_output, '%s\n', rotate_right_shift(input_bits_bin, amt_bin));
    end
end