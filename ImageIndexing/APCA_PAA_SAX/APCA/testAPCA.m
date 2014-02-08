%% #################  Test APCA############################################


%Generation du signal S
N=100;
dp1=cumsum(randn(1,N));
dp2=cumsum(randn(1,N));
S = dp1.^2+dp2.^2;
S=(S-mean(S))/std(S);
%Choix de l'ondelette et du coefficient de réduction d'énérgie
wav='haar';
energy_coeff=0.5;

%% Test
Smean=compute_APCA(S,wav,energy_coeff);

%% Tracé des fonctions
%Moyenne effective
figure;
plot(S);
hold on;
pause;
plot(Smean,'k');
title(' APCA');legend('original signal','approximation');
pause;
hold off;

