% Cette fonction realise le suillage d'un vecteur, les elements du vecteur d'entree de module inferieur 
% a un seuil donne sont tous remis a zero
%   Entrees:
%       Sig: le vecteur sur lequel on veut realiser le seuillage
%       maxCeil: le seuil, au dessous duquel le seuillage sera realise
%   Sorties:
%       cldSig: vecteur contenant les elements de Sig où les coefficients de module inferieur au seuil seront remis a zero
%
%	

function cld_Sig = threshold(Sig,maxCeil)					
																	
cld_Sig=(abs(Sig)>maxCeil).*Sig;	%Tout les coefficients de details de module inférieur au seuil ne seront pas retenus
															


	

