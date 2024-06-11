clc
m = 85; % masa ručke
M = 3.5; % masa točkova
R = 0.1; % poluprečnik točkova
Iw = 0.1; % moment inercije točkova
Ir = 70; % moment inercije ručke
l = 1.7; % dužina ručke
g = 9.81;
%T = 0; % moment na točkovima
K = 1; 

% %% kobasice
% 
k1 = (M + m) * R + Iw/R;
k2 = m*l*R;
k3 = m*l;
k4 = Ir + m*l*l;
k5 = m*l*g;
k6 = m*l*R;
% %% kobaja grande
% 
% K1 = (-(Iw + (M + m)*R*R)*m*g*L)/(m*m*L*L*R - (Iw + (M + m)*R*R)*(Ir + m*L*L));
% K2 = (m*m*L*L*R*g)/(m*m*L*L*R*R - (Iw + (M + m)*R*R)*(Ir + m*L*L));
% K3 = (m*L*R + (Iw + (M + m)*R*R)*K)/(m*m*L*L*R*R - (Iw + (M + m)*R*R)*(Ir + m*L*L));
% K4 = (R*(Ir + m*L*L) + m*L*R*R*K)/(m*m*L*L*R*R - (Iw + (M + m)*R*R)*(Ir + m*L*L));



%% Matrice linearna
%x1= teta
%x2= dteta
%x3= x
%x4= dx


Im = Iw + (M+m)*R*R;
I = Ir + m*l*l;

A = [0, 1, 0, 0; k5*k1/(k4*k1 - k2*k3), 0, 0, 0; 0, 0, 0, 1; - k2*k5/(k4*k1 - k2*k3), 0, 0, 0];
B = [0; (-K*k1 - k3)/(k4*k1 - k2*k3); 0; 1/k1 + ((K*k1+k3)/(k4*k1-k2*k3))*(k2/k1)];
C = [1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];

D = 0;

s=tf('s');
I=[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
F=-C*(s*I-A)^(-1)*B+D;
%% PID Koeficienti

P=[-1,-1,-1,-1];
PDreg_acker=acker(A,B,P);

PD_teta=PDreg_acker(1)
PD_dteta=PDreg_acker(2)

PD_x=PDreg_acker(3)
PD_dX=PDreg_acker(4)

%% Kod za 4. domaci

sys=ss(A,B,C,D);
G=tf(sys)
W=PDreg_acker*G;

W=minreal(W,1e-3)

nyquist(W);
% PhaseMargin[deg]*pi/180[deg]/frequency[rad/s]=0.166[s]
