% Cette fonction trouve le seuil maximal pour reduire l'energie d'un signal d'un coefficient Q. Elle est realisee sous forme
% de recherche dichotomique.
%   Entrees:
%       S: le signal dont on veut reduire l'energie
%       Q: le pourcentage d'energie a reduire
%   Sorties:
%       seuil: valeur du seuil qui reduit l'energie
%
%	

function seuil=energCeil(S,Q)
if Q>1 || Q<0
	disp('WARNING: le pourcentage Q doit etre compris entre 0 et 1');
	return;
else
	energy_S=sqrt(sum(S.^2));	%%energie du signal
	goal_energy=energy_S*Q;		%%energie cherchee
	current_energy=energy_S;
	current_signal=abs(S);
	next_signal=threshold(current_signal,sum(current_signal)/sum(current_signal~=0));
	next_energy=sqrt(sum(next_signal.^2));

	while(abs(current_energy-goal_energy)>abs(next_energy-goal_energy))
	    current_signal=next_signal;
	    current_energy=next_energy;
	    next_signal=threshold(current_signal,sum(current_signal)/sum(current_signal~=0));
	    next_energy=sqrt(sum(next_signal.^2));
	end

	current_signal=sign(S).*current_signal;
	seuil=min(current_signal(current_signal>0));
end