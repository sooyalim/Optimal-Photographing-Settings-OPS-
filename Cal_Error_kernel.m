

%% functions


function Error_kernel = Cal_Error_kernel(MB, OFFB, noise, M, kernel_res)

% Motion blur kernel
MB_kernel_size = int64(MB*kernel_res); %kernel size for MB. kernel_res for precise kernel
x_trapmf=linspace(-MB/2,MB/2,MB_kernel_size);
if MB>2*M % if the level of MB is higher than 2 times M: uniform pdf
    MB_kernel = trapmf(x_trapmf,[-MB/2,-MB/2+M,MB/2-M,MB/2]); %kernel for MB
elseif MB>M% if the level of MB is higher than M but lower than 2 times M: trapezoidal-shaped pdf
    MB_kernel = trapmf(x_trapmf,[-MB/2,MB/2-M,-MB/2+M,MB/2]); %kernel for MB
else
    if MB_kernel_size==0 % if the kernel size is below 1
        MB_kernel = zeros(1,11);
        MB_kernel(1,6) = 1;
    else
        MB_kernel = ones(1,MB_kernel_size); %kernel for MB
    end
end
MB_kernel = MB_kernel./sum(MB_kernel,"all"); % normalization


% Out of focus blur kernel
OFFB_kernel_size = double(int64(OFFB*kernel_res)); %kernel size for OFFB. kernel_res for precise kernel
if OFFB_kernel_size==0 % if the kernel size is below 1
    OFFB_kernel = zeros(11,11);
    OFFB_kernel(6,6) = 1;
else
    OFFB_kernel = fspecial('gaussian', [7*OFFB_kernel_size 7*OFFB_kernel_size], OFFB_kernel_size);  %kernel for OFFB; 7 for padding
end
OFFB_kernel = OFFB_kernel./sum(OFFB_kernel,"all"); % normalization


% Noise kernel
Noise_kernel_size = int64(noise*kernel_res); %kernel size for Noise. kernel_res for precise kernel
if Noise_kernel_size==0 % if the kernel size is below 1
    Noise_kernel = zeros(1,11);
    Noise_kernel(1,6) = 1;
else
    alpha_gausswin = (6*Noise_kernel_size-1)/(2*Noise_kernel_size);
    Noise_kernel = gausswin(6*Noise_kernel_size,alpha_gausswin); %kenel for noise
    Noise_kernel = Noise_kernel'; %Make row wise
end
Noise_kernel = Noise_kernel./sum(Noise_kernel,"all"); % normalization

MB_OFFB_kernel = conv2(MB_kernel,OFFB_kernel); %combine between MB and OFFB
MB_OFFB_Noise_kernel = conv2(MB_OFFB_kernel,Noise_kernel); %combine MB, OFFB, noise

size_kernel = size(MB_OFFB_Noise_kernel);
if mod(size_kernel(1),2)==0 %if row length is even number. To make a center
    MB_OFFB_Noise_kernel(end+1,:)=0; %add empty row to make odd number
end

if mod(size_kernel(2),2)==0 %if column length is even number. To make a center
    MB_OFFB_Noise_kernel(:,end+1)=0; %add empty column to make odd number
end

Error_kernel = MB_OFFB_Noise_kernel./sum(MB_OFFB_Noise_kernel,"all"); %normalization

end

