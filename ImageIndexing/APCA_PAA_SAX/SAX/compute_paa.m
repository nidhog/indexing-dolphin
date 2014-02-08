function PAA = compute_paa(signal, Nseg)

N = length(signal); 
Nsaut = N/Nseg;
reshapedSig = reshape(signal, Nsaut,Nseg);
moy = mean(reshapedSig);
signalPAA = repmat(moy, Nsaut, 1);
signalPAA = signalPAA(:);
PAA=signalPAA;
