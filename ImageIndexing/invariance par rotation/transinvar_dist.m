% Cette fonction calcul une distance invariante par rotation de la courbe (donc par translation de la paramétrisation)
% Entrées:
% 	A: paramétrisation de la première courbe
% 	B: paramétrisation de la seconde courbe
% 	dist: mesure de distance de reference (exemple distance euclidienne, dynamic time warping etc.)
% Sorties:
% 	min_dist: distance minimale
% 	transform: transformation de la paramétrisation
% 	index: indice considéré comme le début de B

function [min_dist,transform,index]=transinvar_dist(A,B,dist)
if nargin == 2
    dist=@(x,y) sqrt(sum((x-y).^2));
end

if length(A)~=length(B)
    disp('WARNING: A and B should be of the same length, the longest sequence will be cropped to fit the other.');
    if length(A)>length(B)
        A=A(1:length(B));
    else
        B=B(1:length(A));
    end
end
C=B;
min_dist=dist(A,B);
for l=1:length(A)
    
    temp=C(1);
    for k=2:length(C)
        C(k-1)=C(k);
    end
    C(end)=temp;
    
    new_dist = dist(A,C);
    if new_dist<min_dist
        index=l;
        transform=C;
        min_dist=new_dist;
    end
end
    
