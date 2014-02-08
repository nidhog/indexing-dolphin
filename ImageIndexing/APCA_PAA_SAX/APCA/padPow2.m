% Cette fonction transforme un vecteur de longueur N en longueur M, 
% tel que M est la plus petite puissance de 2 supérieure ou égale à N
% et ceci en remplissant le vecteur par des zeros
%   Entrees:
%       S: un vecteur de longueur N quelconque
%   Sorties:
%  	newS: le nouveau vecteur de longueur M telle que M est la plus petite puissance de 2 superieure ou égale à N
%	

function newS = padPow2(S)
N=length(S);

if(floor(log2(N))==log2(N))
    newS=S;	%%Si la fonction est deja une puissance de 2 newS=S
else		%%Sinon nous creons un vecteur de zeros de longeure M que nous remplissons avec les valeurs de S
    M=nextpow2(N);
    tempS=zeros(1,2^M);
    tempS(1:N)=S;
    newS=tempS;
end
