function output = logic_right_shift(input, amt)
if amt == '000'
    output = input;
elseif amt == '001'
    output = ['0' input(1) input(2) input(3) input(4) input(5) input(6) input(7)];
elseif amt == '010' 
    output = ['0' '0' input(1) input(2) input(3) input(4) input(5) input(6)];
elseif amt == '011'
     output = ['0' '0' '0' input(1) input(2) input(3) input(4) input(5)];
elseif amt == '100'
    output = ['0' '0' '0' '0' input(1) input(2) input(3) input(4)];
elseif amt == '101'
    output = ['0' '0' '0' '0' '0' input(1) input(2) input(3)];
elseif amt == '110'
    output = ['0' '0' '0' '0' '0' '0' input(1) input(2)];
else
    output = ['0' '0' '0' '0' '0' '0' input(1)];
end