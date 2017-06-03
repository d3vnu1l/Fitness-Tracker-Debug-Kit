function [ height ] = fitness_b(  )
clear

[filename, pathname] =uigetfile('.csv');
dataSet = csvread(strcat(pathname, filename));
acceleration = dataSet(1:size(dataSet,1),3);

t = 0:(length(acceleration)-1);
len = (length(acceleration)-1);
%   ****LPF FILTER****
acceleration_comb = zeros(1,len+1);
acceleration_lpf = zeros(1,len+1);

height = zeros(1,len+1);
velocity = zeros(1,len+1);
velocity_filtered = zeros(1,len+1);

%filter vars%

%hpf a
gain_a = 1.003141603;
xa = zeros(1,2);
ya = zeros(1,2);

%lpf a
gain_lp_a = 16.89454484;
xa_lp = zeros(1,2);
ya_lp = zeros(1,2);

%hpf v
gain_v = 1.004712424;
xv = zeros(1,2);
yv = zeros(1,2);

for n = 2:len
    %lpf of HPF acceleration:
    xa_lp(1) = xa_lp(2); 
    xa_lp(2) = acceleration(n) / gain_lp_a;
    ya_lp(1) = ya_lp(2); 
    ya_lp(2) =   (xa_lp(2) + xa_lp(1)) + (  0.8816185924 * ya_lp(1));
    acceleration_lpf(n) = ya_lp(2);
    
    %hpf acceleration
    xa(1) = xa(2); 
    xa(2) = acceleration_lpf(n) / gain_a;
    ya(1) = ya(2); 
    ya(2) =   (xa(2) - xa(1)) + (  0.9937364715 * ya(1));
    acceleration_comb(n) = ya(2);
    
    amag = abs(acceleration_comb(n));
    %velocity
    if(amag<210) 
        velocity(n) = velocity(n-1);
    else       
        velocity(n) = velocity((n-1)) + (.01*acceleration_comb(n));
    end
    
    %hpf velocity
    xv(1) = xv(2); 
    xv(2) = velocity(n) / gain_v;
    yv(1) = yv(2); 
    yv(2) =   (xv(2) - xv(1)) + (  0.9906193578 * yv(1));
    velocity_filtered(n) = yv(2);
    
    %height
    if(velocity(n-1)<0 & velocity(n)>0)
         height(n)= 0;
    else
         height(n) = height((n-1))+ (.01*velocity_filtered(n));
    end
    
    %height reduction
    if(amag<50)
        height(n)=height(n)*.99;
    end
    
end
plot(t,acceleration, t, acceleration_lpf,t,acceleration_comb);
legend 'original' 'lpf' 'hpf-lpf'
zoom xon;
figure;
plot(t, height, t, acceleration_comb , t, velocity_filtered);
legend 'height' 'velocity' 'hpf_velocity';
zoom xon;

end