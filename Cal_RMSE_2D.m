function RMSE_2D = Cal_RMSE_2D(Error_kernel, kernel_res)

% Pixel binning
[ker_x, ker_y] = size(Error_kernel);
cen_x = (ker_x + 1) / 2; % center of the Error_kernel in x direction
cen_y = (ker_y + 1) / 2; % center of the Error_kernel in y direction

res_x = floor(ker_x / kernel_res); % number of pixels in x direction
res_y = floor(ker_y / kernel_res); % number of pixels in y direction

% If res_x or res_y is even number, make it odd
if mod(res_x, 2) == 0
    res_x = res_x + 1; % make it odd
end
if mod(res_y, 2) == 0
    res_y = res_y + 1; % make it odd
end

cen_res_x = (res_x+1)/2; % center pixel
cen_res_y = (res_y+1)/2; % center pixel

res_x_start = 1 - cen_res_x; % i index start
res_x_end = res_x - cen_res_x; % i index end
res_y_start = 1 - cen_res_y; % j index start
res_y_end = res_y - cen_res_y; % j index end

m_start = -(kernel_res+1)/2 + 1; % m start -1/2
m_end = (kernel_res+1)/2 -1; % m end 1/2
n_start = -(kernel_res+1)/2 + 1; % n start -1/2
n_end = (kernel_res+1)/2 -1; % n end 1/2

% results for the binning
epsilon_xy = zeros(kernel_res, kernel_res); % empty matrix for epsilon_(x,y)

for m = m_start:m_end  % x index in the reference pixel
    m_idx = m + (kernel_res+1)/2;
    
    for n = n_start:n_end % y index in the reference pixel
        n_idx = n + (kernel_res+1)/2;
        
        for i = res_x_start:res_x_end % i index in the pixel domain
            x_start = max(1, cen_x - (kernel_res+1)/2 + i*kernel_res - m + 1);
            x_end = min(ker_x, cen_x  - (kernel_res+1)/2 + (i+1)*kernel_res  - m);
            
            for j = res_y_start:res_y_end % j index in the pixel domain
                y_start = max(1, cen_y  - (kernel_res+1)/2 + j*kernel_res  - n + 1);
                y_end = min(ker_y, cen_y  - (kernel_res+1)/2 + (j+1)*kernel_res  - n);
                
                Error_subMatrix = Error_kernel(x_start:x_end, y_start:y_end);
                P_ij_xy=sum(Error_subMatrix,'all'); % calculate P((i,j)|(x,y))
                epsilon_xy(m_idx, n_idx) = epsilon_xy(m_idx, n_idx) + P_ij_xy*((m/kernel_res-i)^2+(n/kernel_res-j)^2); % add errors for each i,j
                
            end
        end
        
    end
end

RMSE_2D=sqrt(sum(epsilon_xy,'all')/(kernel_res*kernel_res)); %numerical integration. RMSE 2D in pixel units

end
