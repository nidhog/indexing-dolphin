% Représentation symbolique SAX (Symbolic Aggregate Approximation) d'un
% signal, sans itérations de la valeur dans les segments
%Entrees:
%   signal:     signal à représenter en SAX
%   unif_nb:    longueur de séquence mise en correspondance 
%   nseg:       nbre de segments de la PAA
%   Nsymbol:    nombre de symboles de l'alphabet
%Sorties:
%   SAX: représentation symbolique de 'signal' sans itérations
%
function SAX=SAX_rep(signal, unif_nb, nseg, Nsymbol)

% coeffSaut: #symboles à fusionner
coeffSaut = floor(unif_nb/nseg);                         

SAX=zeros(1,nseg);  

for i=1:length(signal)-(unif_nb-1)                                       
    
    current_vec = signal(i:unif_nb-1+i); 
    if (mod(unif_nb,nseg))                               
        temp = zeros(unif_nb,nseg);
        for j=1:nseg
            temp(:,j)=current_vec;
        end
        
        PAA = mean(reshape(reshape(temp,1,unif_nb*nseg),unif_nb,nseg));
    else                                                
        PAA = mean(reshape(current_vec,coeffSaut,nseg));
    end

    current_string=zeros(1:length(PAA));
    bkpoints=breakpoint_gen(Nsymbol);
    for k=1:lenght(PAA)
       current_string(i) = sum( (bkpoints <= PAA(i)), 2 );
    end;
    
    if current_string ~= SAX(end,:)
        SAX=[SAX; current_string];     
    end;
end;
SAX=SAX(2:end,:);
