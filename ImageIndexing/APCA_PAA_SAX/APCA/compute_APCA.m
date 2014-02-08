% Cette fonction renvoie le signal approximé en APCA d'un signal. Le vecteur renvoyee est de meme longueure que celui en entree
%   Entrees:
%       signal: le signal à approximer
%       wavelet: l'ondelette choisie pour la transformée
%	energ_coeff: le pourcentage d'énergie retenue pour les coefficients de details
%   Sorties:
%       APCA: la representation APCA du signal
%
%	
function APCA=compute_APCA(signal,wavelet,energ_coeff,enable_plot)
 if nargin == 0 
        disp('A 256 length random signal was generated. using haar wavelet. The energy of detail coefficients will be reduced by 50%');
        signal = generate_signal(256);
        wavelet='haar';
        energ_coeff=0.5;
        enable_plot=1;
 else if nargin==3
         enable_plot=0;
     end
 end

signal=(signal-mean(signal))/std(signal);

S_pad=padPow2(signal);


[S_approx,S_details]=recupDWT(S_pad,wavelet);
S_details=threshold(S_details,energCeil(signal,energ_coeff));
S_rec=reconstructDWT(S_approx,S_details,wavelet);

S_mean=realMean(S_rec,signal);

APCA=S_mean;

%% Tracée des signaux
if enable_plot==1
    plot(signal);
    hold on;
    pause;
    plot(APCA,'k');
    hold off;
    pause;
    close all;
end

%%
% Dans le cas où aucune fonction n'est présentée en entrée, la fonction suivante génère un signal aléatoire. Le signal aléatoire
% généré est le carée des déplacements d'un mouvement Brownien
%
% Entree: N: longueur du signal à générer
% Sortie: signal: signal generée aléatoirement 
%
function signal=generate_signal(N)
dp1=cumsum(randn(1,N));
dp2=cumsum(randn(1,N));
signal = dp1.^2+dp2.^2;
signal=(signal-mean(signal))/std(signal);
