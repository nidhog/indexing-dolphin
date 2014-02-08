% Cette fonction retourne la représentation APCA (Adaptive Piecewise Constant Approximation). La sortie est un vecteur de deux lignes
% la première contenant les coordonées des segments et la deuxième les valeurs correspondantes
%   Entrees:
%       S: le signal que l'on souhaite approximer
%	wav: l'ondelette choisie pour l'approximation
%       energ_coeff: le pourcentage en energie que l'on veut réduire lors de la transformation
%   Sorties:
%       V: vecteur de représentation: signal de deux lignes
%
%	

function V=APCA_rep(S,wav,energ_coeff,enable_plot)

if nargin==1
    wav='haar';
    energ_coeff=0.5;
    enable_plot=0;
else if nargin==3
        enable_plot=0;
    end
end

APCA=compute_APCA(S,wav,energ_coeff,enable_plot);
M=length(APCA);
F=findStep(APCA);
N=length(F);
V=zeros(2,N);
V(1,:)=[F(2:N) M];
V(2,:)=APCA(V(1,1:N));
