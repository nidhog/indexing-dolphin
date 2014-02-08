% Cette fonction retrouve les positions où la valeur du signal varie
%   Entrees:
%       M: signal
%   Sorties:
%       stepMat: matrice contenant les indices où M change de valeure
%
%	
function [stepMat]=findStep(M)
stepMat=1;
for i=2:(length(M)-1)
    if M(i)~=M(i+1)
        stepMat=[stepMat i];
    end
end

end
