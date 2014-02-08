% Cette fonction recupere les coefficients d'approximation et de detail 
% par la transformée en ondelettes
%   Entrees:
%       Sig: le signal d'entree
%       wav: l'ondelette choisie pour la transformée en ondelettes
%	plot_coeff: pour choisir de tracer ou non les coefficients de details
%   Sorties:
%       approx: la valeur permettant la reconstruction du signal
%	details: matrice contenant les coefficients de details
%	

function [approx,details] = recupDWT(Sig,wav,enable_plot)
if nargin==2
	enable_plot=0;
end

%% Initialisation
    [A,D]=dwt(Sig,wav);
    details=D;

    L=length(Sig);

%% Recuperation des coefficients
    while L>1
        [A,D]=dwt(A,wav);
        details=[D details];
        L=length(A);
    end
    
    approx=A;

%% Tracé des graphes
if enable_plot==1
	figure; 
	plot(details);
	title('Coefficients de details');
end
