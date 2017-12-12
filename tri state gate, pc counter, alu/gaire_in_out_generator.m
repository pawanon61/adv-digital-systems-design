% tri state gate
file_input_1 = fopen('gaire_tri_state_gate_input.txt', 'w');
file_output_1 = fopen('gaire_tri_state_gate_expected_output.txt', 'w');
bits = 16;
for input_number = 0:20:2^bits-1
    for en = 0:1
        fprintf(file_input_1, "%s %s\n", int2str(en), dec2bin(input_number, bits));
        if en == 1
            fprintf(file_output_1, "%s\n", dec2bin(input_number, bits));
        else
            fprintf(file_output_1, "ZZZZZZZZZZZZZZZZ\n");
        end
    end
    
end


% program counter
file_input_2 = fopen('gaire_program_counter_input.txt', 'w');
file_output_2 = fopen('gaire_program_counter_expected_output.txt', 'w');
bits = 16;
% reset = 1
fprintf(file_input_2, "%s\n", "1 1 0011110011010110");
fprintf(file_output_2, "%s\n", "0000000000000000 0000000000000001");
re_set = 0;
store_value = '0000000000000000';
store_value_plus = '0000000000000001';
for input_number = 1:2000:2^bits-2 %for 2^bits-1, the value of store_value_plus will be 17 bits
    for en = 0:1
        if en == 1
            store_value = dec2bin(input_number, bits);
            store_value_plus = dec2bin(input_number+1, bits);
        else
            store_value = store_value;
            store_value_plus = store_value_plus;
        end
        fprintf(file_input_2, "%s %s %s\n", int2str(re_set), int2str(en), dec2bin(input_number, bits));
        fprintf(file_output_2, "%s %s\n", store_value, store_value_plus);
    end
end


% ALU
file_input_3 = fopen('gaire_alu_input.txt', 'w');
file_output_3 = fopen('gaire_alu_expected_output.txt', 'w');
bits = 16;
for input1 = 25:55
    for input2 = 0:20
        for sel = 0:3
            fprintf(file_input_3, "%s %s %s\n", dec2bin(sel,2), dec2bin(input1, bits), dec2bin(input2, bits));
            if sel == 0
                a = dec2bin(input1 + input2, bits);
                fprintf(file_output_3, "%s\n", a);
            elseif sel == 1
                b = dec2bin(input1-input2, bits);
                fprintf(file_output_3, "%s\n", b);
            elseif sel == 2
                c = ~(dec2bin(input1, bits) == '1');
                c = num2str(c);
                c = c(find(~isspace(c))); % removing space from the string
                fprintf(file_output_3, "%s\n", c);
            else
                d =  (dec2bin(input1, bits) == '1') & (dec2bin(input2, bits) == '1');
                d = num2str(d);
                d = d(find(~isspace(d)));
                fprintf(file_output_3, "%s\n", d);
            end
        end
    end
end