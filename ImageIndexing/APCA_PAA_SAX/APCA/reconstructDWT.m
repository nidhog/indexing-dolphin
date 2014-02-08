% Cette fonction reconstruit un signal a partir de son approximation et des coefficients de details donnés
%   Entrees:
%       approx: valeur permettant la reconstruction du signal
%       details: le vecteur des coefficients de details
%	wav: l'ondelette choisie pour la transformee
%   Sorties:
%       Sig: signal reconstruit à partir de l'approximation et des coefficients de details
%
%	

function Sig = reconstructDWT(approx,details,wav)

Sig=[approx details];
S=idwt(approx,details(1),wav);
L=length(S);

while L<=(length(Sig)/2)
    S=idwt(S,Sig(L+1:2*L),wav);
    L=length(S);
end

Sig=S;

