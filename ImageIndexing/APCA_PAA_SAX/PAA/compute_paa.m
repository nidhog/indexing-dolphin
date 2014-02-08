% Cette fonction retourne la représentation PAA (Piecewise Adaptive Approximation)
%   Entrees:
%       signal: Signal à approximer
%	Nseg: nombre de segments souhaité
%   Sorties:
%       PAA: signal de représentation PAA de signal d'entrée
%
function PAA = compute_paa(signal, Nseg)
N = length(signal);
if 	
Nsaut = N/Nseg;
reshapedSig = reshape(signal, Nsaut,Nseg);
moy = mean(reshapedSig);
signalPAA = repmat(moy, Nsaut, 1);
signalPAA = signalPAA(:);
PAA=signalPAA;
