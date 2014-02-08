%
% Cette fonction renvoie la représentation symbolique d'un signal
% Entrées:
%   signal:     Le signal à transformer
%   nbr_seg:    nombre de segments de la représentation (doit diviser la
%   longueur du signal 
%   Nsymbol:    Nombre de symboles de l'alphabet à utiliser
% Sorties:
%   str:        cellules contenant les symboles représentant le signal

function [str] = compute_SAX(signal,nbr_seg,Nsymbol)


N=length(signal);

        
    % Tester si nbr_seg divise N
    if (mod(N, nbr_seg))
        disp('Longueure de signal non compatible avec la longeur du signal');
        return;  
    end;

    % coeffSaut: largeur de la fenetre
    coeffSaut = floor(N/nbr_seg);
    % Normalisation du signal
    signal = (signal - mean(signal))/std(signal); % Chaque nombre sera remplacé par: (nombre-moyenne)/ecart-type

    plot(signal);

    pause;
    hold on;

   % PAA
    PAA = compute_paa(signal,nbr_seg);
    
    plot(PAA,'r');
    legend('Original Signal','PAA');
    pause;
    
   %
    str = disc_paa(signal, nbr_seg, Nsymbol);
    
    [breakpoints,alphabet]  = breakpoint_gen(Nsymbol);
    
    frontiere = repmat(breakpoints', 1, N)';    
    set(plot(frontiere),'color',[0.5 0.5 0.5]);
    hold on;
    text(coeffSaut,min(signal),char(str+96));
    
    for i = 1 : nbr_seg
        pos = (i-1) * coeffSaut + 1;    
        text(pos+(coeffSaut/2), PAA(pos)+0.1, alphabet(str(i)),'fontsize',12);
    end
    
    hold off;
    
    str = alphabet(str);
    pause;
    close all;