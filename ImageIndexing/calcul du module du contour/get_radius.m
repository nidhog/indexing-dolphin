% Cette fonction donne le module du contour avec ou sans minimisation de la distance de Hausdorff
% Entrées:
% 	bin: image binaire
% 	with_minH: choix de minimisation de la distance de Hausdorff (une valeur de 1 en entrée effectue cette minimisation)
% 	ref: contour de reference pour la minimisation de la distance de Hausdorff
% Sorties:
% 	R: module du contour

function R = get_radius(bin,with_minH,ref)

if nargin==1
    with_minH = 0;
end

    C = bin2contour(bin); 
    C_n = (C - mean(C)) / std(C);
if with_minH==1
    rC = bin2contour(ref);
    rC_n = (rC - mean(rC)) / std(rC);
    [rot_C,angle]=rot_till_min(rC_n,C_n);
    stop=floor((angle*length(rot_C))/(2*pi));
    if stop>length(rot_C)
        stop=mod(stop,length(rot_C));
    for j=1:stop
        temp=rot_C(1);
        for k=1:length(rot_C)-1
            rot_C(k)=rot_C(k+1);
        end
        rot_C(end)=temp;
    end
    R=abs(rot_C);
else
    R=abs(C_n);
end
    
