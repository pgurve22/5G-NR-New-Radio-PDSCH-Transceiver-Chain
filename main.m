clear;
clc;
fprintf("For N = 20496\n  PRBs = 100\n  Modulation order = 2\n");
prompt = "Enter the length of transport block for MCS 9 - "; 
fprintf("\n");
N = input(prompt);
message = randi([0,1],1,N);
original_message = message;

B = N+24;                 %Transport Block length with TB-CRC
Kcb = 8448;         
L = 24;
C = ceil(B/(Kcb-L));
CB_len = B/C;             %No of Code blocks
kb = 22;                  %for base graph one

%gCRC24c polynomial's degrees with coefficient equal to one
gCRC24c = [0,1,2,4,8,12,13,15,17,20,21,23,24];

%generating array of 25bits------
gen_poly = zeros(1,25);

%Appending ones according to the gCRC24c polynomial------
for i=gCRC24c
    gen_poly(i+1)=1; 
end

%Flipping the generator polynomial i.e. starting with the highest degree of
%polynomial
gen_poly = flip(gen_poly);

%Appending no of zeros equal to the no of bits in CRC polynomial i.e. 25-1
%= 24
append_zeros = zeros(1,24);

%message squences with appended zero------
message= [message append_zeros];

%CRC append----------
[message] = appendfunc(message,gen_poly);
message(1:N) = original_message;
crc_24bits = message(N+1:N+24);

%Transport Block with TB-CRC---------
TB_CRC = message;

%Preallocation for Code Block matrix-------
CB_mat = zeros(C,CB_len+24);

%Segmentation of TB into Code Blocks-------
for i=1:C
    CB_mat(i,1:CB_len) = TB_CRC(((i-1)*CB_len)+1:(i*CB_len));
end
original_CB_mat = CB_mat(1:C,1:CB_len);

%CRC append for each row (i.e. Code Block)of Code block matrix-------
for i=1:C
    CB_mat(i,1:(CB_len+24)) = appendfunc(CB_mat(i,1:(CB_len+24)),gen_poly);
    CB_mat(i,1:CB_len) = original_CB_mat(i,1:CB_len);
end

%finding minimun value of Zc------------
Zc = (CB_len+24)/kb;
ZcVec = [2:16 18:2:32 36:4:64 72:8:128 144:16:256 288:32:384];
for i=1:length(ZcVec)
    if ZcVec(i)>Zc
        Zc = ZcVec(i);
        break
    end
end

%filler bits addition----------
no_of_filler_bits = (Zc*22)-(CB_len+24);
filler_bits = -1*ones(C,no_of_filler_bits);
CB_mat = [CB_mat filler_bits];
IN = CB_mat';   %As first i/p argument(i.e IN) of LDPCEncode is a coloumn vector  
nbg = 1;        %base graph number----
nldpcdecits = 25;

%LDPC encoding-----
ldpc_coded_bits = double(LDPCEncode(IN,nbg)); 
ldpc_coded_bits = ldpc_coded_bits';

%Rate Matcher---------
prompt = "Enter no of PRBs - "; 
PRBs = input(prompt);
%PRBs = 100;         %number of PRBs 
no_of_pilots = 6;    %number of REs use for pilots
prompt = "Enter order of modulation - "; 
mod_order = input(prompt);
%mod_order = 2;      %modulation order for MCS-9 is 2
C_dash = 66*Zc;     %length of output of LDPC encoder
G = PRBs*((12*14)-no_of_pilots)*mod_order; %total number of allowable bits
E = G/C;            %length of allowable bits for each code block

%Puncturing the last C_dash-E number of bits---------
Rate_matched_output = ldpc_coded_bits(1:C,1:E);

%Interleaver--------
M = mod_order;
len = E/M;
rows = zeros(C*M,len);

%Writing-----                                     
for i=1:C
    for j=1:M
        rows((M*(i-1))+j,1:len) = Rate_matched_output(i,((j-1)*len)+1:len*j);
    end
end

%Reading------
interleaved_output = zeros(C,length(E));
for i=1:C
    for j=1:len
        interleaved_output(i,((j-1)*M)+1:M*j) = rows((M*(i-1))+1:(M*i),j);
    end
end

%Concatenation of Code Blocks-------
concat_of_CB_row_vect= zeros(1,G);
for i=1:C
    concat_of_CB_row_vect(((i-1)*E)+1:i*E) = interleaved_output(i,1:E);
end

%Random sequence generator------
%Gold sequence of length 31 bits--------
x1_of_n = zeros(1,31);
x1_of_n(1) = 1;

x2_of_n = zeros(1,31);
x2_of_n(1:8) = 1; 

for i=1:G+1600-31
    x1_of_n(i+31) = xor(x1_of_n(i),x1_of_n(i+4));
    x2_of_n(i+31) = xor(x2_of_n(i),x2_of_n(i+2));
    x2_of_n(i+31) = xor(x2_of_n(i+31),x2_of_n(i+3));
    x2_of_n(i+31) = xor(x2_of_n(i+31),x2_of_n(i+4));
end
c_of_n = xor(x1_of_n,x2_of_n);

%Ignoring the first 1600 bits of squence-----
c_of_n1(1:G) = c_of_n(1600+1:G+1600); 

%Scrambler-------
scrambled_bits = zeros(1,G);
for i=1:G
    scrambled_bits(i) = xor(concat_of_CB_row_vect(i),c_of_n1(i));
end
scrambled_bits_col_vect = scrambled_bits';
leng = length(scrambled_bits_col_vect );

%QPSK modulation-------------
%Concatenated Code block(i.e. Coloumn vector) divided into two half----

%first half taken as inphase bits-----
inphase_bits=scrambled_bits_col_vect(1:leng/2,1);

%second half taken as quadrature bits------
quad_bits=scrambled_bits_col_vect((leng/2)+1:leng,1);

%conversion of 0 and 1 into -1 and 1
inphase_bits=(2*inphase_bits)-1;
quad_bits=(2*quad_bits)-1;

%Generating the QPSK symbols-------
qpsk_sym = inphase_bits+sqrt(-1)*quad_bits;
mod_output = qpsk_sym;

noise_power = sqrt(0.00001);

%noise for inphase bits- and quadrature bits------
inphase_noise = rand(length(inphase_bits),1);
quad_noise = rand(length(quad_bits),1);

%Generating complex noise-------
noise = noise_power*(inphase_noise+sqrt(-1)*quad_noise);

%Received symbols after transmission-----
rx_sym = mod_output + noise;
real1 = real(rx_sym);
imag1 = imag(rx_sym);

%llr decoding for inphase bits-----
llr0_i =  abs(-1 + real1);  
llr1_i =  abs(1 + real1);    

%ldpc decoder requires log(p(r/0)/p(r/1))------
llr_i = log(llr0_i./llr1_i);      

%demodulated inphase bits------
demod_output_i = llr_i; 

%llr decoding for quadrature bits-------
llr0_q =  abs(-1 + imag1);   
llr1_q =  abs(1 + imag1);    

%LDPC decoder requires log(p(r/0)/p(r/1))------
llr_q = log(llr0_q./llr1_q);  

%Demodulated quadrature bits-----------
demod_output_q = llr_q; 

%Total demodulated output i.e. first half for iphase bits and second half
%for quadrature bits---------
demod_output=[demod_output_i;demod_output_q];
punctured_bits=-0.5*ones(C_dash-E,C);

%Descrambler------
c_dash = (-2*c_of_n1)+1;
descrambled_bits = (demod_output').*c_dash;

%Segmentation of demodulated output into Code Blocks into matrix------
segment_CB = zeros(C,E);  
for i=1:C
     segment_CB(i,1:E) = descrambled_bits(((i-1)*E)+1:i*E);  
end

%Deinterleaver-------
rows = zeros(C*M,len);

%Reading-------
for i=1:C
    for j=1:M
        for k=1:len
            rows((M*(i-1))+j,k) = segment_CB(i,(M*(k-1))+j);
        end
    end
end

%Writing-----
deinterleaved_output = zeros(C,E);
for i=1:C
    for j=1:M
        deinterleaved_output(i,((j-1)*len)+1:(j*len)) = rows((M*(i-1))+j,1:len);
    end
end

%Rate recovery of each Code Blocks-------
Rate_recoverd_output = [deinterleaved_output';punctured_bits];

%LDPC decoding of Rate recovered Code Block matrix--------
outputbits = double(LDPCDecode(Rate_recoverd_output,nbg,25));
errors = find(outputbits - IN);

%Removal of filler bits from each Code Block---------
CB_det_mat = outputbits(1:(CB_len+24),1:C)';
CB_det_mat_fin = outputbits(1:(CB_len),1:C)';

%Validation of CB-CRC for each code block-----------
for i=1:C
    CB_det_mat(i,1:(CB_len+24)) = validatefunc(CB_det_mat(i,1:(CB_len+24)),gen_poly);
end
fprintf("\n");
if CB_det_mat == zeros(C,CB_len+24)
    fprintf("CB CRC Validation output = 1\n")
else
    fprintf("CB CRC Validation output = 0\n")
end

%Concatenation of Code Block into single Transport Block-------
TB_det = zeros(1,N+24);
for i=1:C
    TB_det(((i-1)*CB_len)+1:i*(CB_len)) = CB_det_mat_fin(i,1:CB_len);
end
original_TB_det = TB_det(1:N);

%Validation of TB-CRC-------------
TB_det = validatefunc(TB_det,gen_poly);
if TB_det == zeros(1,N+24)
    fprintf("TB CRC Validation output = 1\n")
else
    fprintf("TB CRC Validation output = 0\n")
end

%Received transport block----------- 
%Original_message is nothing but our input message------
TB_det = TB_det(1:N);
if original_message == original_TB_det
    fprintf("Message detection output = 1\n")
else
    fprintf("Message detection output = 0\n")
end



