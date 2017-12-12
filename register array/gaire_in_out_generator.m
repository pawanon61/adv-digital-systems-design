file_input = fopen('gaire_register_array_input.txt', 'w'); 
file_output = fopen('gaire_register_array_expected_output.txt', 'w');

input_text = [dec2bin(1,1) ' '  dec2bin(0,1) ' ' dec2bin(0,3) ' ' dec2bin(0,16) ' ' dec2bin(0,3) ' ' dec2bin(0,3)];
output_text = [dec2bin(0,16) ' ' dec2bin(0,16)];
fprintf(file_input, '%s\r\n', input_text);
fprintf(file_output, '%s\r\n', output_text);  

val = 0;
b1 = 0;
b2 = 0;
b3 = 0;
b4 = 0;
b5 = 0;
b6 = 0;
b7 = 0;
b8 = 0;
for j = 0: 5
    for k = 0 : 7
        for l = 0 :1
            en = dec2bin(l,1);
            input = val + k;
        
%  PSEUUDO REGISTER
            a1= dec2bin(b1, 16);
            a2= dec2bin(b2, 16);
            a3= dec2bin(b3, 16);
            a4= dec2bin(b4, 16);
            a5= dec2bin(b5, 16);
            a6= dec2bin(b6, 16);
            a7= dec2bin(b7, 16);
            a8= dec2bin(b8, 16);
       
            sr1 = randi([0,7]);
            sr1 = dec2bin(sr1, 3);
            sr2 = randi([0,7]);
            sr2 = dec2bin(sr2, 3);
            dr = dec2bin(k, 3);  % acts as a multiplexer
%STORING IN REGISTER
            if (en == '1')
                if (dr == "000")
                    b1 = input;
                elseif (dr == "001")
                    b2 = input;
                elseif (dr == "010")
                    b3 = input;
                elseif (dr == "011")
                    b4 = input;
                elseif (dr == "100")
                    b5 = input;
                elseif (dr == "101")
                    b6 = input;
                elseif (dr == "110")
                    b7 = input;
                else
                    b8 = input;
                end
            end
            if (sr1 == "000")
                OP_Q1 = a1;
            elseif (sr1 == "001")
                OP_Q1 = a2;
            elseif (sr1 == "010")
                OP_Q1 = a3;
            elseif (sr1 == "011")
                OP_Q1 = a4;
            elseif (sr1 == "100")
                OP_Q1 = a5;
            elseif (sr1 == "101")
                OP_Q1 = a6;
            elseif (sr1 == "110")
                OP_Q1 = a7;
            else
                OP_Q1 = a8;
            end
            if (sr2 == "000")
                OP_Q2 = a1;
            elseif (sr2 == "001")
                OP_Q2 = a2;
            elseif (sr2 == "010")
                OP_Q2 = a3;
            elseif (sr2 == "011")
                OP_Q2 = a4;
            elseif (sr2 == "100")
                OP_Q2 = a5;
            elseif (sr2 == "101")
                OP_Q2 = a6;
            elseif (sr2 == "110")
                OP_Q2 = a7;
            else
                OP_Q2 = a8;
            end
        reset = '0';
        input = dec2bin(val+k, 16);
        input_text = [reset ' '  en ' ' dr ' ' input ' ' sr1 ' ' sr2];
        output_text = [OP_Q1 ' ' OP_Q2];
        fprintf(file_input, '%s\r\n', input_text);
        fprintf(file_output, '%s\r\n',output_text);
        end
    end
end
