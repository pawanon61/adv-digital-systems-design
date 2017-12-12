function y = gaire_in_out_generator_for_shift3mode()
lar_bits = 2;  % to select which shift to use- rotate or logic or arithmetic shift
amt_bits=3;  % to select the amount by which to shift the given binary number
input_bits = 8;  % number of input bits
%below are input and output files
file_input = fopen('gaire_shift3mode_input.txt', 'w');
file_output = fopen('gaire_shift3mode_expected_output.txt', 'w');

for i = 0:3
    lar_bin = dec2bin(i, lar_bits);
    for j = 0:7
        amt_bin = dec2bin(j, amt_bits);
        for k = 0:255
            input_bits_bin = dec2bin(k, input_bits);
            fprintf(file_input, '%s\n', [lar_bin ' ' amt_bin ' ' input_bits_bin]);
            if lar_bin == '00'
                fprintf(file_output, '%s\n', arithmetic_right_shift(input_bits_bin, amt_bin));
            elseif lar_bin == '01'
                fprintf(file_output, '%s\n', logic_right_shift(input_bits_bin, amt_bin));
            else
                fprintf(file_output, '%s\n', rotate_right_shift(input_bits_bin, amt_bin));
            end
        end
    end
end