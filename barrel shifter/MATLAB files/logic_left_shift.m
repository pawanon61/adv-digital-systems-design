function output = logic_left_shift(input, amt)
if amt == '000'
    output = input;
elseif amt == '001'
    output = [input(2) input(3) input(4) input(5) input(6) input(7) input(8) '0'];
elseif amt == '010' 
    output = [input(3) input(4) input(5) input(6) input(7) input(8) '0' '0'];
elseif amt == '011'
    output = [input(4) input(5) input(6) input(7) input(8) '0' '0' '0'];
elseif amt == '100'
    output = [input(5) input(6) input(7) input(8) '0' '0' '0' '0'];
elseif amt == '101'
    output = [input(6) input(7) input(8) '0' '0' '0' '0' '0'];
elseif amt == '110'
    output = [input(7) input(8) '0' '0' '0' '0' '0' '0'];
else
    output = [input(8) '0' '0' '0' '0' '0' '0' '0'];
end