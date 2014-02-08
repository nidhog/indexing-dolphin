%
% Cette fonction convertie une série temporelle en une chaine de caractères
%
% Entrees:
%   signal:     vecteur représentant la série temporelle à convertir
%   nseg:       nombre de ségments de la représentation PAA
%   Nsymbol:    nombre de symboles de l'alphabet
%
% Sorties:
%   signal_d:    représentation du signal en chaine de caractères
%

function signal_d =  disc_paa(signal, nseg, Nsymbol)

N=length(signal);
coeffSaut = floor(N/nseg);     

   
    % PAA sans répétition des valeures
    PAA = mean(reshape(signal,coeffSaut,nseg));
      
    signal_d = zeros(1,length(PAA));
    bkpoints=[-inf breakpoint_gen(Nsymbol)];
    for i = 1 : length(PAA)    
        signal_d(i) = sum( (bkpoints <= PAA(i)), 2 );
    end;
