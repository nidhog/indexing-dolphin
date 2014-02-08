%
% Entrees:
%   sym_sig1:   représentation symbolique du premier signal
%   sym_sig2:   représentation symbolique du second signal
%   Nsymbol:    Nombre de symboles de l'alphabet choisie
%   N_on_m:     le ratio N/m ou m est la longueur de la chaine de
%   représentation et N la lonngueur initiale du signal
% Sorties:
%   mindist:    La distance MINDIST de la représentation SAX
%
function mindist=sax_MINDIST(sym_sig1,sym_sig2,Nsymbol,N_on_m)

    bkpoints=breakpoint_gen(Nsymbol); % generation des breakpoints correspondants
                                      % à l'alphabet choisie
                                      
    dist_matrix=zeros(Nsymbol); % dist_matrix(i,j) devra contenir la distance entre le symbole i et j
                                % pour deux symboles adjacents la distance
                                % est nulle

    %Generation de dist_mat
    for i = 1 : alphabet_size
        for j = i+2 : alphabet_size
            dist_matrix(i,j)=(bkpoints(i)-bkpoints(j-1))^2;
            dist_matrix(j,i) = dist_matrix(i,j);
        end;
    end;  
    
    %calcul de min_dist
    mindist=sqrt(N_on_m * sum(diag(dist_matrix(sym_sig1,sym_sig2))));

    
    