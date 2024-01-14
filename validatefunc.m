% Validate function for CRC

function [message] = validatefunc(message,gen_poly)
i = 1;
while i<=(length(message)-length(gen_poly)+1)
    if message (i) == 1 && i~=(length(message)-length(gen_poly)+1)
		temp = xor(gen_poly, message(i:i+length(gen_poly)-1));
		message(i:i+length(gen_poly)-1) = temp;
        i=i+1;

	elseif message (i) == 1 && i == length(message)-length(gen_poly)+1 
		temp1 = xor(gen_poly, message(length(message)-length(gen_poly)+1:length(message)));
		message(length(message)-length(gen_poly)+1:length(message)) = temp1;
    else
        i=i+1;
    end
end
