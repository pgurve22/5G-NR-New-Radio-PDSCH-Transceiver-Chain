clc;
clear all;
code_block = round(rand(7744,1));
nbg = 1; % Base graph 1
nldpcdecits = 25; % Decode with maximum no of iteration
  
%----------------------------------LDPC encoding----------------------- ------------------------
  
ldpc_coded_bits = double(LDPCEncode(code_block,nbg)); 
   
mod_output = 2*(ldpc_coded_bits-0.5);
   

noise_power = (10^-5);
noise = sqrt(noise_power)*randn(size(mod_output));
rx_sig = mod_output + noise; % to add noise

llr0 =  abs(-1 + rx_sig);   % BPSK demod
llr1 =  abs(1 + rx_sig);    % BPSK demod

llr = log(llr0./llr1);      % ldpc decoder requires log(p(r/0)/p(r/1))
demod_output = llr;

%----------------------------------LDPC decoding----------------------- -------------------------

outputbits = double(LDPCDecode(demod_output,nbg,nldpcdecits));

errors = find(outputbits - code_block);