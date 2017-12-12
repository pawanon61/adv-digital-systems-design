
% generate input and expected output for 4 to 1 MUX to the txt file
file_input = fopen('gaire_4_to_1_multiplexer_input.txt', 'w');
file_output = fopen('gaire_4_to_1_multiplexer_expected_output.txt', 'w');
for i = 0:5:15
    for j = 0:5:15
        for k= 0:5:15
            for l = 0:5:15
                for selector = 0:3
                     formatspec = "%s %s %s %s %s\n";
                    fprintf(file_input, formatspec, dec2bin(i,16), dec2bin(j,16), dec2bin(k,16), dec2bin(l,16), dec2bin(selector,2));
                    if selector == 0                        
                        fprintf(file_output, "%s\n", dec2bin(i,16));
                    elseif selector == 1                       
                        fprintf(file_output, "%s\n", dec2bin(j,16));
                    elseif selector == 2
                        fprintf(file_output, "%s\n", dec2bin(k,16));
                    else
                        fprintf(file_output, "%s\n", dec2bin(l,16));
                    end
                end
            end
        end
    end
end



% generate input and expected output for 3 to 1 MUX to the txt file
file_input = fopen('gaire_3_to_1_multiplexer_input.txt', 'w');
file_output = fopen('gaire_3_to_1_multiplexer_expected_output.txt', 'w');
for i = 0:5:15
    for j = 0:5:15
        for k= 0:5:15
            for selector = 0:2
                 formatspec = "%s %s %s %s\n";
                fprintf(file_input, formatspec, dec2bin(i,16), dec2bin(j,16), dec2bin(k,16), dec2bin(selector,2));
                if selector == 0                        
                    fprintf(file_output, "%s\n", dec2bin(i,16));
                elseif selector == 1                       
                    fprintf(file_output, "%s\n", dec2bin(j,16));
                else
                    fprintf(file_output, "%s\n", dec2bin(k,16));
                end
            end
        end
    end
end



% generate input and expected output for 2 to 1 MUX to the txt file
file_input = fopen('gaire_2_to_1_multiplexer_input.txt', 'w');
file_output = fopen('gaire_2_to_1_multiplexer_expected_output.txt', 'w');

for i = 0:5:15
    for j = 0:5:15
        for selector = 0:1
            formatspec = "%s %s %s\n";
            fprintf(file_input, formatspec, dec2bin(i,16), dec2bin(j,16), dec2bin(selector,1));
            if selector == 0                        
                fprintf(file_output, "%s\n", dec2bin(i,16));
            elseif selector == 1                       
                fprintf(file_output, "%s\n", dec2bin(j,16));
            else
                fprintf(file_output, "%s\n", dec2bin(k,16));
            end
        end
    end
end

